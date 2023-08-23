unit Unit15;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  Tinsere_item_saida = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    MOV: TEdit;
    nomecfo: TEdit;
    qtd_prd: TEdit;
    Button1: TButton;
    Button2: TButton;
    tipo: TEdit;
    combo_prd2: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure qtd_prdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  insere_item_saida: Tinsere_item_saida;

implementation

{$R *.dfm}

uses Unit9, Unit1, Unit2;

procedure Tinsere_item_saida.Button1Click(Sender: TObject);
begin
//Verifica se tem duplicidade de inser��o do produto
DM.verifica_dup.Close;
DM.verifica_dup.SQL.Clear;
DM.verifica_dup.SQL.Add('SELECT * FROM TITMMOV WHERE NOMEPRD = (:DUP) AND IDMOV =(:IDDUP)');
DM.verifica_dup.ParamByName('IDDUP').AsString := MOV.Text;
DM.verifica_dup.ParamByName('DUP').AsString := combo_prd2.Text;
DM.verifica_dup.Open;

if DM.verifica_dup.RecordCount > 0 then
begin
ShowMessage('Produto j� incluido no movimento!');
combo_prd2.KeyValue := null;
combo_prd2.SetFocus;
Abort;
end;

//atualiza o estoque do produto
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD SET ESTOQUE = (ESTOQUE - (:QTD2)) WHERE NOMEPRD = (:NOMEPRD)');
//codigo da linha acima d� baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := combo_prd2.Text;
DM.qry_uptmov.ExecSQL;


//insere o item na tabela de itens do movimento
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('INSERT INTO TITMMOV(IDMOV, IDPRD, NOMEPRD, QUANTIDADE)');
DM.qry_insertprd.SQL.Add('VALUES (:IDMOV,(SELECT IDPRD FROM TPRD WHERE NOMEPRD = :NOMEPRD), :NOMEPRD, :QTD)');
DM.qry_insertprd.ParamByName('IDMOV').AsString := (MOV.Text);
DM.qry_insertprd.ParamByName('NOMEPRD').AsString := (combo_prd2.Text);
DM.qry_insertprd.ParamByName('QTD').AsString := (qtd_prd.Text);
DM.qry_insertprd.ExecSQL;
insere_item_saida.Close;


//atualiza grid de itens de movimento da tela de saida de produtos
form9.att_titmmov.Click;
ShowMessage('Produto adicionado com sucesso!');
form2.Enabled := True;
form2.SetFocus;
form2.Show;
end;

procedure Tinsere_item_saida.Button2Click(Sender: TObject);
begin
form2.Enabled := true;
form2.SetFocus;
insere_item_saida.close;
ShowMessage('Altera��o cancelada!');
end;

procedure Tinsere_item_saida.FormShow(Sender: TObject);
begin
DM.qry_prd.Open;
end;

procedure Tinsere_item_saida.qtd_prdKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then key := #0;
end;

end.
