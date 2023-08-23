unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls;

type
  TForm7 = class(TForm)
    pnl_cadsetor: TPanel;
    Label1: TLabel;
    Image1: TImage;
    bt_fechar: TSpeedButton;
    pnl_baixo: TPanel;
    sel_data2: TDateTimePicker;
    grid_mov2: TDBGrid;
    inclui_lan: TButton;
    bt_cancel_mov: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    MOV: TEdit;
    grid_mov_sel: TDBGrid;
    FILTRAR: TButton;
    sel_data3: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    bt_editaritem: TButton;
    bt_exclui: TButton;
    bt_inclui: TButton;
    Label5: TLabel;
    status: TLabel;
    att_titmmov2: TButton;
    procedure inclui_lanClick(Sender: TObject);
    procedure FILTRARClick(Sender: TObject);
    procedure grid_mov2CellClick(Column: TColumn);
    procedure bt_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_cancel_movClick(Sender: TObject);
    procedure bt_editaritemClick(Sender: TObject);
    procedure pnl_cadsetorClick(Sender: TObject);
    procedure pnl_baixoClick(Sender: TObject);
    procedure bt_excluiClick(Sender: TObject);
    procedure bt_incluiClick(Sender: TObject);
    procedure att_titmmov2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses Unit11, Unit2, Unit1, Unit13, Unit14;

procedure TForm7.att_titmmov2Click(Sender: TObject);
begin
DM.qry_mov_completo.Close;
DM.qry_mov_completo.SQL.Clear;
DM.qry_mov_completo.SQL.Add('SELECT TITMMOV.NOMEPRD, TITMMOV.QUANTIDADE, TITMMOV.PK '+
'FROM TMOV INNER JOIN FCFO ON TMOV.IDCFO = FCFO.IDCFO INNER JOIN usuarios ON TMOV.IDUSER = usuarios.IDUSER INNER JOIN titmmov ON TMOV.IDMOV = TITMMOV.IDMOV WHERE TMOV.IDMOV = (:MOV)');
DM.qry_mov_completo.ParamByName('MOV').AsString := (form7.grid_mov2.Columns[0].Field.text);
DM.qry_mov_completo.Open;
MOV.Text := form7.grid_mov2.Columns[0].Field.text;
status.Caption := grid_mov2.Columns[5].Field.text;
end;

procedure TForm7.bt_cancel_movClick(Sender: TObject);
begin
//se movimento ja tiver cancelado nao deixa executar novamente
if grid_mov2.Columns[5].Field.text = 'CANCELADO' then
begin
ShowMessage('N�o � poss�vel cancelar um movimento com STATUS: CANCELADO.');
Abort;
end
else
begin
if MessageBox(HANDLE, 'Deseja CANCELAR o movimento ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = idyes then
begin
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TMOV SET STATUS = ("CANCELADO") WHERE IDMOV = (:IDCAN)');
dm.qry_uptmov.ParamByName('IDCAN').AsString := grid_mov2.SelectedField.Text;
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD INNER JOIN TITMMOV ON TPRD.IDPRD = TITMMOV.IDPRD SET ESTOQUE = (ESTOQUE - TITMMOV.QUANTIDADE)WHERE TITMMOV.IDMOV = (:IDCAN)');
DM.qry_uptmov.ParamByName('IDCAN').AsString := grid_mov2.SelectedField.Text;  //codigo da linha acima retorna os produtos para o estoque quando cancela o movimento
DM.qry_uptmov.ExecSQL;
filtrar.Click;
ShowMessage('Movimento cancelado com sucesso!');
att_titmmov2.Click;
end;
end;
end;

procedure TForm7.bt_editaritemClick(Sender: TObject);
begin
if status.Caption = 'CANCELADO' then
begin
ShowMessage('N�o � poss�vel editar um item de movimento CANCELADO.');
Abort;
end
else
begin
grid_mov_sel.ReadOnly := false;
edita_mov.Show;
form2.Enabled := false;

edita_mov.MOV.Text := form7.grid_mov2.Columns[0].Field.text;
edita_mov.tipo.Text := grid_mov2.Columns[1].Field.text;
edita_mov.nomecfo.Text := form7.grid_mov2.Columns[4].Field.text;
edita_mov.nome_prd.Text := form7.grid_mov_sel.Columns[0].Field.text;
edita_mov.qtd_atual.Text := form7.grid_mov_sel.Columns[1].Field.text;
end;
end;

procedure TForm7.bt_excluiClick(Sender: TObject);
begin
if status.Caption = 'CANCELADO' then
begin
ShowMessage('N�o � poss�vel EXCLUIR um item de movimento CANCELADO.');
Abort;
end;
if MessageBox(HANDLE, 'Deseja EXCLUIR o item de movimento ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = idyes then
begin
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('UPDATE TPRD SET ESTOQUE = (ESTOQUE - (:QTD)) WHERE NOMEPRD = (:NOMEPRD)');
DM.qry_uptmov.ParamByName('QTD').AsString := grid_mov_sel.Columns[1].Field.Text;  //codigo da linha acima d� baixa nas quantiadades de itens contidas na tabela de itens de movimento
DM.qry_uptmov.ParamByName('NOMEPRD').AsString := grid_mov_sel.Columns[0].Field.Text;
DM.qry_uptmov.ExecSQL;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('DELETE FROM TITMMOV WHERE PK = (:PK)');
DM.qry_uptmov.ParamByName('PK').AsString := grid_mov_sel.Columns[2].Field.Text;
DM.qry_uptmov.ExecSQL;

ShowMessage('Item Exclu�do com Sucesso!');
//Atualizar itens de movimento
att_titmmov2.Click;
end;
end;

procedure TForm7.bt_fecharClick(Sender: TObject);
begin
Form7.Close;
end;

procedure TForm7.bt_incluiClick(Sender: TObject);
begin
if status.Caption = 'CANCELADO' then
begin
ShowMessage('N�o � poss�vel editar um item de movimento CANCELADO.');
Abort;
end
else
begin
dm.qry_prd.Active := False;
dm.qry_prd.Active := True;
insere_item.Show;
insere_item.combo_prd2.KeyValue := null;
insere_item.vl_uni.Text := '';
insere_item.qtd_prd.Text := '';
form2.Enabled := false;

insere_item.MOV.Text := form7.grid_mov2.Columns[0].Field.text;
insere_item.tipo.Text := grid_mov2.Columns[1].Field.text;
insere_item.nomecfo.Text := form7.grid_mov2.Columns[4].Field.text;

end;
end;

procedure TForm7.FILTRARClick(Sender: TObject);
var
dat:string;
dat2:string;
begin
with dm.qry_tmov do
dm.qry_tmov.Close;
dm.qry_tmov.SQL.Clear;
dm.qry_tmov.SQL.Add('SELECT TMOV.IDMOV, TMOV.TIPOMOV, TMOV.DATA, USUARIOS.USER, FCFO.NOME, TMOV.STATUS FROM TMOV INNER JOIN USUARIOS ON TMOV.IDUSER = USUARIOS.IDUSER INNER JOIN FCFO ON TMOV.IDCFO = FCFO.IDCFO WHERE DATA BETWEEN (:DT2) AND (:DT) AND TIPOMOV LIKE "E"');
dat := (FormatDateTime('yyyy-mm-dd 23-59-59',Form7.sel_data2.Date));
dat2 := (FormatDateTime('yyyy-mm-dd hh-mm-ss',Form7.sel_data3.Date));
dm.qry_tmov.ParamByName('DT').AsString := dat;
dm.qry_tmov.ParamByName('DT2').AsString := dat2;
dm.qry_tmov.Open;
grid_mov2.Columns[3].Width := 70;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
sel_data2.Date := date;
filtrar.Click;
sel_data3.Date := date;
end;

procedure TForm7.grid_mov2CellClick(Column: TColumn);
begin
att_titmmov2.Click;
end;

procedure TForm7.inclui_lanClick(Sender: TObject);
begin
entradas.Refresh;
entradas.Show;
entradas.idmov2.DataSource := DM.ds_idmov;
with dm.qry_uptmov do
DM.qry_for.Open;
DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT *  FROM TPRD WHERE STATUS = "ATIVO" ORDER BY NOMEPRD');
DM.qry_prd.Open;
DM.qry_uptmov.Close;
DM.qry_uptmov.SQL.Clear;
DM.qry_uptmov.SQL.Add('INSERT INTO TMOV(TIPOMOV, DATA, IDUSER, IDCFO,STATUS)'); //insere o tmov sequencial
DM.qry_uptmov.SQL.Add('VALUES ( "E",:tdata , NULL,NULL,"OK")');
dm.qry_uptmov.ParamByName('tdata').AsDateTime := Now;
DM.qry_uptmov.ExecSQL;
DM.qry_idmov.Close;
DM.qry_idmov.Open;
DM.tb_titmmov.Filtered := false;
DM.tb_titmmov.Filter   := 'Upper(IDMOV) like' + QuotedStr(AnsiUpperCase('%'+entradas.idmov2.Text+'%')); //filtra a tabela de itens com base no campo do seu idmov
DM.tb_titmmov.Filtered := true;
end;

procedure TForm7.pnl_baixoClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

procedure TForm7.pnl_cadsetorClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

end.
