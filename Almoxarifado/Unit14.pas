unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  Tinsere_item = class(TForm)
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
    Label5: TLabel;
    vl_uni: TEdit;
    combo_prd2: TDBLookupComboBox;
    procedure vl_uniKeyPress(Sender: TObject; var Key: Char);
    procedure qtd_prdKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  insere_item: Tinsere_item;

implementation

{$R *.dfm}

uses Unit2, Unit1, Unit7;

procedure Tinsere_item.Button1Click(Sender: TObject);
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
DM.qry_uptmov.SQL.Add('UPDATE TPRD SET ESTOQUE = (ESTOQUE + (:QTD2)), VLUNIT = (:VL) WHERE NOMEPRD = (:NOMEPRD)');
DM.qry_uptmov.ParamByName('VL').AsString := vl_uni.Text; //codigo da linha acima d� baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ParamByName('QTD2').AsString := qtd_prd.Text;
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := combo_prd2.Text;
DM.qry_uptmov.ExecSQL;


//insere o item na tabela de itens do movimento
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('INSERT INTO TITMMOV(IDMOV, IDPRD, NOMEPRD, QUANTIDADE, VLENTRADA)');
DM.qry_insertprd.SQL.Add('VALUES (:IDMOV,(SELECT IDPRD FROM TPRD WHERE NOMEPRD = :NOMEPRD), :NOMEPRD, :QTD, :VL)');
DM.qry_insertprd.ParamByName('IDMOV').AsString := (MOV.Text);
DM.qry_insertprd.ParamByName('NOMEPRD').AsString := (combo_prd2.Text);
DM.qry_insertprd.ParamByName('QTD').AsString := (qtd_prd.Text);
DM.qry_insertprd.ParamByName('VL').AsString := vl_uni.Text;
DM.qry_insertprd.ExecSQL;
insere_item.Close;
form2.Enabled := True;

//atualiza grid de itens de movimento da tela de saida de produtos
form7.att_titmmov2.click;
end;


procedure Tinsere_item.Button2Click(Sender: TObject);
begin
Form2.Enabled := True;
form2.SetFocus;
insere_item.close;
ShowMessage('Altera��o cancelada!');
end;

procedure Tinsere_item.FormShow(Sender: TObject);
begin
DM.qry_prd.Open;
end;

procedure Tinsere_item.qtd_prdKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then key := #0;
end;

procedure Tinsere_item.vl_uniKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9','.',#8]) then key := '.';

if (key in [',']) then key := '.';
end;

end.
