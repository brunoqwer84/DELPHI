unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  Ttela_lanca_saida = class(TForm)
    grid_titmmov: TDBGrid;
    box_fcfo: TDBLookupComboBox;
    navi_titmmov: TDBNavigator;
    combo_prd: TDBLookupComboBox;
    qtd_prd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bt_insert: TButton;
    idmov: TDBEdit;
    bt_salvar: TButton;
    bt_cancelar: TButton;
    Label6: TLabel;
    est_atual: TDBEdit;
    exc_item: TButton;
    src_prd: TButton;
    procedure bt_fecharClick(Sender: TObject);
    procedure bt_insertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure combo_prdClick(Sender: TObject);
    procedure qtd_prdKeyPress(Sender: TObject; var Key: Char);
    procedure exc_itemClick(Sender: TObject);
    procedure box_fcfoEnter(Sender: TObject);
    procedure combo_prdExit(Sender: TObject);
    procedure box_fcfoClick(Sender: TObject);
    procedure src_prdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tela_lanca_saida: Ttela_lanca_saida;

implementation

{$R *.dfm}

uses Unit1, Unit9, Unit2, Unit8, Unit17, Unit4, Unit18;

procedure Ttela_lanca_saida.box_fcfoClick(Sender: TObject);
begin
DM.qry_clifor.Close;
DM.qry_clifor.SQL.Clear;
DM.qry_clifor.SQL.Add('SELECT *  FROM FCFO WHERE CLIFOR LIKE "C"  AND ATIVO = "ATIVO" ORDER BY NOME');
DM.qry_clifor.Open;

end;

procedure Ttela_lanca_saida.box_fcfoEnter(Sender: TObject);
begin
dm.qry_clifor.Close;
dm.qry_clifor.Open;
end;

procedure Ttela_lanca_saida.bt_cancelarClick(Sender: TObject);
begin
if MessageBox(HANDLE, 'Deseja CANCELAR ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = idyes then
begin
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('DELETE FROM TITMMOV WHERE IDMOV = (:IDC)');
DM.qry_insertprd.ParamByName('IDC').AsString := idmov.Text ;
DM.qry_insertprd.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('DELETE FROM TMOV WHERE IDMOV = (:IDC)');
dm.qry_uptmov.ParamByName('IDC').AsString := idmov.Text ;
DM.qry_uptmov.ExecSQL;
DM.qry_idmov.Close;
DM.qry_idmov.Open;
tela_lanca_saida.Refresh;
tela_lanca_saida.Close;
Form2.Enabled := True;
Form2.SetFocus;
ShowMessage('Opera��o cancelada!');
Form9.FILTRAR.Click;
end;
end;

procedure Ttela_lanca_saida.bt_fecharClick(Sender: TObject);
begin
tela_lanca_saida.Close;
end;

procedure Ttela_lanca_saida.bt_insertClick(Sender: TObject);
var num1,num2:real;
begin
if qtd_prd.Text = '' then
begin
qtd_prd.SetFocus;
ShowMessage('Preencha a quantidade!');
Abort;
end;
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('INSERT INTO TITMMOV(IDMOV, IDPRD, NOMEPRD, QUANTIDADE)');
DM.qry_insertprd.SQL.Add('VALUES (:IDMOV,(SELECT IDPRD FROM TPRD WHERE NOMEPRD = (:NOMEPRD)),:NOMEPRD, :QTD)');
DM.qry_insertprd.ParamByName('IDMOV').AsString := (idmov.Text);
DM.qry_insertprd.ParamByName('NOMEPRD').AsString := (combo_prd.Text);
DM.qry_insertprd.ParamByName('QTD').AsString := (qtd_prd.Text);
DM.qry_insertprd.ExecSQL;
num1:= StrTofloat(qtd_prd.text);
num2:= StrTofloat(est_atual.text);
if num1 > num2 then
begin
ShowMessage('Produto com estoque negativo ap�s sa�da');
end;
DM.tb_titmmov.Active := True;
DM.tb_titmmov.Filtered := false;
DM.tb_titmmov.Filter   := 'Upper(IDMOV) like' + QuotedStr(AnsiUpperCase('%'+idmov.Text+'%'));
DM.tb_titmmov.Filtered := true;
combo_prd.KeyValue := null;
qtd_prd.Text := '';
combo_prd.SetFocus;
end;

procedure Ttela_lanca_saida.bt_salvarClick(Sender: TObject);
begin
// nao deixa salvar se nao selecionar consumidor e adicionar pelo menos 1 produto
if (box_fcfo.KeyValue = null) or (grid_titmmov.DataSource.DataSet.RecordCount = 0) then
begin
ShowMessage('Preencha todos os campos!');
abort;
end
else
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD INNER JOIN TITMMOV ON TPRD.IDPRD = TITMMOV.IDPRD SET ESTOQUE = (ESTOQUE - TITMMOV.QUANTIDADE)WHERE TITMMOV.IDMOV = (:IDSAIDA)');
DM.qry_uptmov.ParamByName('IDSAIDA').AsString := idmov.Text;  //codigo da linha acima d� baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TMOV SET IDCFO = (SELECT IDCFO FROM FCFO WHERE NOME = (:IDCF)), IDUSER = (SELECT IDUSER FROM USUARIOS WHERE USER =(:USER)) WHERE IDMOV = (:IDMV)');
dm.qry_uptmov.ParamByName('IDMV').AsString := idmov.Text;
dm.qry_uptmov.ParamByName('IDCF').AsString := box_fcfo.Text;
dm.qry_uptmov.ParamByName('USER').AsString := principal.user.Text;
DM.qry_uptmov.ExecSQL;
tela_lanca_saida.Close;
tela_lanca_saida.Refresh;
tela_lanca_saida.Close;
Form2.Enabled := True;
Form2.SetFocus;
ShowMessage('Sa�da gerada com sucesso!');
Form9.FILTRAR.Click;
end;


//atualiza campo de estoque do item
procedure Ttela_lanca_saida.combo_prdClick(Sender: TObject);
begin
DM.qry_estoque_atual.Close;
DM.qry_estoque_atual.SQL.Clear;
DM.qry_estoque_atual.SQL.Add('SELECT ESTOQUE FROM TPRD WHERE NOMEPRD = (:NM)');
DM.qry_estoque_atual.ParamByName('NM').AsString := combo_prd.Text;
DM.qry_estoque_atual.Open;
end;

//valida��o para nao deixar incluir produto repetido no movimento
procedure Ttela_lanca_saida.combo_prdExit(Sender: TObject);
begin
DM.verifica_dup.Close;
DM.verifica_dup.SQL.Clear;
DM.verifica_dup.SQL.Add('SELECT * FROM TITMMOV WHERE NOMEPRD = (:DUP) AND IDMOV =(:IDDUP)');
DM.verifica_dup.ParamByName('IDDUP').AsString := idmov.Text;
DM.verifica_dup.ParamByName('DUP').AsString := combo_prd.Text;
DM.verifica_dup.Open;

if DM.verifica_dup.RecordCount > 0 then
begin
ShowMessage('Produto j� incluido no movimento!');
combo_prd.KeyValue := null;
combo_prd.SetFocus;
end;

end;

procedure Ttela_lanca_saida.exc_itemClick(Sender: TObject);
begin
navi_titmmov.BtnClick(nbDelete);
end;

procedure Ttela_lanca_saida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
with dm.qry_tmov do
dm.qry_tmov.Close;
dm.qry_tmov.SQL.Clear;
dm.qry_tmov.SQL.Add('SELECT * FROM TMOV WHERE DATA = (:DT)');
dm.qry_tmov.ParamByName('DT').AsDate := (Form9.sel_data.Date);
dm.qry_tmov.Open;
end;

procedure Ttela_lanca_saida.FormShow(Sender: TObject);
begin
Form2.Enabled := False;
tela_lanca_saida.SetFocus;
box_fcfo.KeyValue := null;
combo_prd.KeyValue := null;
est_atual.Text := '';
qtd_prd.Text :='';
end;



//retorna campo vazio se quantidade digitada nao for num�rica.
procedure Ttela_lanca_saida.qtd_prdKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9',#8, #13]) then key := #0;
end;

procedure Ttela_lanca_saida.src_prdClick(Sender: TObject);
begin
form18.Show;
end;

end.
