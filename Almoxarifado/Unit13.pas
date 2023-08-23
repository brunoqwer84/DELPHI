unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tedita_mov = class(TForm)
    MOV: TEdit;
    Label1: TLabel;
    nomecfo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    nome_prd: TEdit;
    Label4: TLabel;
    qtd_atual: TEdit;
    qtd_prd: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    tipo: TEdit;
    Label6: TLabel;
    ENTRADA: TButton;
    SAIDA: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qtd_prdKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ENTRADAClick(Sender: TObject);
    procedure SAIDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  edita_mov: Tedita_mov;

implementation

{$R *.dfm}

uses Unit2, Unit7, Unit11, Unit1, Unit9;

procedure Tedita_mov.Button1Click(Sender: TObject);
begin
// nao deixa salvar sem quantidade
if qtd_prd.Text = '' then
begin
ShowMessage('Preencha todos os campos!');
abort;
end

else
if tipo.Text = 'E' then
entrada.Click;
Form2.Enabled := True;

if tipo.Text = 'S'  then
saida.Click;
Form2.Enabled := True;
ShowMessage('Alteração Realizada');
end;

procedure Tedita_mov.Button2Click(Sender: TObject);
begin
qtd_prd.Text := '';
edita_mov.Close;
ShowMessage('Alteração cancelada!');
Form2.Enabled := True;
end;

procedure Tedita_mov.ENTRADAClick(Sender: TObject);
begin
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD SET ESTOQUE = (ESTOQUE - (:QTD) + (:QTD2)) WHERE NOMEPRD = (:NOMEPRD)');
DM.qry_uptmov.ParamByName('QTD').AsString := qtd_atual.Text;  //codigo da linha acima dá baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := nome_prd.Text;
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TITMMOV SET QUANTIDADE = (:QTD2) WHERE NOMEPRD = (:NOMEPRD) AND IDMOV = (:IDMOV) ');
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := nome_prd.Text;
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('IDMOV').AsString :=  MOV.Text;
DM.qry_uptmov.ExecSQL;


edita_mov.Close;
qtd_prd.Text := '';
//Atualizar itens de movimento
form7.att_titmmov2.Click;
end;

procedure Tedita_mov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form2.Enabled := true;
end;

procedure Tedita_mov.qtd_prdKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then key := #0;
end;

procedure Tedita_mov.SAIDAClick(Sender: TObject);
begin
if tipo.Text = 'S' then
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD SET ESTOQUE = (ESTOQUE + (:QTD) - (:QTD2)) WHERE NOMEPRD = (:NOMEPRD)');
DM.qry_uptmov.ParamByName('QTD').AsString := qtd_atual.Text;  //codigo da linha acima dá baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := nome_prd.Text;
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TITMMOV SET QUANTIDADE = (:QTD2) WHERE NOMEPRD = (:NOMEPRD) AND IDMOV = (:IDMOV) ');
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := nome_prd.Text;
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('IDMOV').AsString :=  MOV.Text;
DM.qry_uptmov.ExecSQL;

edita_mov.Close;
qtd_prd.Text := '';
//Atualizar itens de movimento
form9.att_titmmov.click;
end;

end.
