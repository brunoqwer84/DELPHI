unit Unit11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tentradas = class(TForm)
    idmov2: TDBEdit;
    Label1: TLabel;
    box_fcfo2: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    grid_titmmov2: TDBGrid;
    combo_prd2: TDBLookupComboBox;
    qtd_prd2: TEdit;
    bt_insert: TButton;
    bt_salvar: TButton;
    bt_cancelar: TButton;
    exc_item: TButton;
    navi2: TDBNavigator;
    Label5: TLabel;
    vl_uni: TEdit;
    procedure exc_itemClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_insertClick(Sender: TObject);
    procedure qtd_prd2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure box_fcfo2Enter(Sender: TObject);
    procedure vl_uniKeyPress(Sender: TObject; var Key: Char);
    procedure combo_prd2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  entradas: Tentradas;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit7, Unit8;

//ao clicar em cancelar exclui o titmmov e tmov baseado no idmov
procedure Tentradas.box_fcfo2Enter(Sender: TObject);
begin
dm.qry_clifor.Close;
dm.qry_clifor.Open;
end;

procedure Tentradas.bt_cancelarClick(Sender: TObject);
begin
if MessageBox(HANDLE, 'Deseja CANCELAR ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = idyes then
begin
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('DELETE FROM TITMMOV WHERE IDMOV = (:IDC2)');
DM.qry_insertprd.ParamByName('IDC2').AsString := idmov2.Text ;
DM.qry_insertprd.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('DELETE FROM TMOV WHERE IDMOV = (:IDC2)');
dm.qry_uptmov.ParamByName('IDC2').AsString := idmov2.Text ;
DM.qry_uptmov.ExecSQL;
DM.qry_idmov.Close;
DM.qry_idmov.Open;
entradas.Refresh;
entradas.Close;
Form2.Enabled := True;
Form2.SetFocus;
ShowMessage('Opera��o cancelada!');
Form7.FILTRAR.Click;
end;
end;

procedure Tentradas.bt_insertClick(Sender: TObject);
begin
if qtd_prd2.Text = '' then
begin
qtd_prd2.SetFocus;
ShowMessage('Preencha a quantidade!');
Abort;
end;
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('INSERT INTO TITMMOV(IDMOV, IDPRD, NOMEPRD, QUANTIDADE, VLENTRADA)');
DM.qry_insertprd.SQL.Add('VALUES (:IDMOV,(SELECT IDPRD FROM TPRD WHERE NOMEPRD = (:NOMEPRD)),:NOMEPRD, :QTD, :VL)');
DM.qry_insertprd.ParamByName('IDMOV').AsString := (idmov2.Text);
DM.qry_insertprd.ParamByName('NOMEPRD').AsString := (combo_prd2.Text);
DM.qry_insertprd.ParamByName('QTD').AsString := (qtd_prd2.Text);
DM.qry_insertprd.ParamByName('VL').AsString := (vl_uni.Text);
DM.qry_insertprd.ExecSQL;
DM.qry_insertprd.Close;
DM.qry_insertprd.SQL.Clear;
DM.qry_insertprd.SQL.Add('UPDATE TPRD SET VLUNIT = (:VL) WHERE NOMEPRD = (:PRD)');
DM.qry_insertprd.ParamByName('VL').AsString := (vl_uni.Text);
DM.qry_insertprd.ParamByName('PRD').AsString := (combo_prd2.Text);
DM.qry_insertprd.ExecSQL;
DM.qry_insertprd.Close;

//DM.tb_titmmov.Filtered := false;
//DM.tb_titmmov.Filter   := 'Upper(IDMOV) like' + QuotedStr(AnsiUpperCase('%'+idmov2.Text+'%'));
//DM.tb_titmmov.Filtered := true;
DM.qry_itementrada.Close;
DM.qry_itementrada.SQL.Clear;
DM.qry_itementrada.SQL.Add('SELECT TITMMOV.IDMOV, TITMMOV.NOMEPRD, TITMMOV.QUANTIDADE, TPRD.VLUNIT FROM TITMMOV INNER JOIN TPRD ON TITMMOV.IDPRD = TPRD.IDPRD WHERE TITMMOV.IDMOV = (:IDTM)');
DM.qry_itementrada.ParamByName('IDTM').AsString := (idmov2.Text);
DM.qry_itementrada.Open;
combo_prd2.KeyValue  := null;
qtd_prd2.Text := '';
vl_uni.Text   := '';
combo_prd2.SetFocus;
end;

procedure Tentradas.bt_salvarClick(Sender: TObject);
begin
// nao deixa salvar se nao selecionar consumidor e adicionar pelo menos 1 produto
if (box_fcfo2.KeyValue = null) or (grid_titmmov2.DataSource.DataSet.RecordCount = 0) then
begin
ShowMessage('Preencha todos os campos!');
abort;
end
else
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD INNER JOIN TITMMOV ON TPRD.IDPRD = TITMMOV.IDPRD SET ESTOQUE = (ESTOQUE + TITMMOV.QUANTIDADE)WHERE TITMMOV.IDMOV = (:IDSAIDA)');
DM.qry_uptmov.ParamByName('IDSAIDA').AsString := idmov2.Text;  //codigo da linha acima d� baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TMOV SET IDCFO = (SELECT IDCFO FROM FCFO WHERE NOME = (:IDCF)), IDUSER = (SELECT IDUSER FROM USUARIOS WHERE USER =(:USER)) WHERE IDMOV = (:IDMV)');
dm.qry_uptmov.ParamByName('IDMV').AsString := idmov2.Text;
dm.qry_uptmov.ParamByName('IDCF').AsString := box_fcfo2.Text;
dm.qry_uptmov.ParamByName('USER').AsString := principal.user.Text;
DM.qry_uptmov.ExecSQL;
entradas.Close;
entradas.Refresh;
entradas.Close;
Form2.Enabled := True;
Form2.SetFocus;
ShowMessage('Entrada gerada com sucesso!');
Form7.FILTRAR.Click;
end;

//valida��o para nao deixar incluir produto repetido no movimento
procedure Tentradas.combo_prd2Exit(Sender: TObject);
begin
DM.verifica_dup.Close;
DM.verifica_dup.SQL.Clear;
DM.verifica_dup.SQL.Add('SELECT * FROM TITMMOV WHERE NOMEPRD = (:DUP) AND IDMOV =(:IDDUP)');
DM.verifica_dup.ParamByName('IDDUP').AsString := idmov2.Text;
DM.verifica_dup.ParamByName('DUP').AsString := combo_prd2.Text;
DM.verifica_dup.Open;

if DM.verifica_dup.RecordCount > 0 then
begin
ShowMessage('Produto j� incluido no movimento!');
combo_prd2.KeyValue := null;
combo_prd2.SetFocus;
end;
end;

procedure Tentradas.exc_itemClick(Sender: TObject);
begin
navi2.BtnClick(nbDelete);
end;

procedure Tentradas.FormShow(Sender: TObject);
begin
Form2.Enabled := False;
entradas.SetFocus;
box_fcfo2.KeyValue := null;
combo_prd2.KeyValue := null;
qtd_prd2.Text :='';
vl_uni.Text   :='';
DM.qry_itementrada.Close;
end;

procedure Tentradas.qtd_prd2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then key := #0;
end;

procedure Tentradas.vl_uniKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0','1','2','3','4','5','6','7','8','9','.',#8]) then key := '.';

if (key in [',']) then key := '.';
end;

end.
