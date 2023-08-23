unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Mask;

type
  TForm5 = class(TForm)
    pnl_baixo: TPanel;
    pnl_cadprd: TPanel;
    Label1: TLabel;
    Image1: TImage;
    bt_fechar: TSpeedButton;
    bt_minimize: TSpeedButton;
    grid_for: TDBGrid;
    busca: TEdit;
    bt_novo: TButton;
    bt_edit: TButton;
    BUSCAR: TLabel;
    navi_for: TDBNavigator;
    pnl_cadfor: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    box_status: TComboBox;
    Edit1: TDBEdit;
    Edit2: TDBEdit;
    Edit3: TDBEdit;
    Edit4: TDBEdit;
    Edit5: TDBEdit;
    Edit6: TDBEdit;
    Edit7: TDBEdit;
    Edit8: TDBEdit;
    Edit9: TDBEdit;
    bt_cancelar: TButton;
    bt_salvar: TButton;
    box_tipo: TComboBox;
    CLIFOR: TLabel;
    Label13: TLabel;
    databox_setores: TDBLookupComboBox;
    setor: TDBEdit;
    Label14: TLabel;
    filtro_tipo: TComboBox;
    procedure bt_fecharClick(Sender: TObject);
    procedure bt_minimizeClick(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_editClick(Sender: TObject);
    procedure box_tipoChange(Sender: TObject);
    procedure buscaChange(Sender: TObject);
    procedure filtro_tipoChange(Sender: TObject);
    procedure pnl_cadprdClick(Sender: TObject);
    procedure pnl_baixoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm5.box_tipoChange(Sender: TObject);
begin
if box_tipo.Text = 'F' then
begin
databox_setores.Enabled := False;
Edit1.Enabled := True;
Edit2.Enabled := True;
Edit3.Enabled := True;
Edit4.Enabled := True;
Edit5.Enabled := True;
Edit6.Enabled := True;
Edit7.Enabled := True;
Edit8.Enabled := True;
Edit9.Enabled := True;
databox_setores.KeyValue := null;
end
else
begin
databox_setores.Enabled := True;
Edit1.Enabled := True;
Edit2.Enabled := True;
Edit3.Enabled := False;
Edit4.Enabled := False;
Edit5.Enabled := False;
Edit6.Enabled := False;
Edit7.Enabled := False;
Edit8.Enabled := False;
Edit9.Enabled := False;
DM.tb_setores.Active := True;
end;
end;

procedure TForm5.bt_cancelarClick(Sender: TObject);
begin
navi_for.BtnClick(nbCancel);
pnl_cadfor.Visible := False;
grid_for.Enabled := True;
end;

procedure TForm5.bt_editClick(Sender: TObject);
begin
if grid_for.FieldCount = 0 then
begin
ShowMessage('Selecione ao menos um registro');
abort;
end;
navi_for.BtnClick(nbEdit);
pnl_cadfor.Visible := True;
grid_for.Enabled := False;
databox_setores.KeyValue := (grid_for.Columns[11].Field.text);
dm.qry_setores.Close;
dm.qry_setores.SQL.Clear;
dm.qry_setores.SQL.Add('SELECT IDSETOR, SETOR FROM SETORES WHERE IDSETOR = (:ID)');
dm.qry_setores.ParamByName('ID').AsString := (grid_for.Columns[11].Field.text);
dm.qry_setores.Open;

databox_setores.KeyValue := setor.Text;

if grid_for.Columns[2].Field.text = 'C' then
begin
box_tipo.ItemIndex := 1;

databox_setores.Enabled := True;
Edit1.Enabled := True;
Edit2.Enabled := True;
Edit3.Enabled := False;
Edit4.Enabled := False;
Edit5.Enabled := False;
Edit6.Enabled := False;
Edit7.Enabled := False;
Edit8.Enabled := False;
Edit9.Enabled := False;

end;
if grid_for.Columns[2].Field.text = 'F' then
begin
box_tipo.ItemIndex := 0;

databox_setores.Enabled := False;
Edit1.Enabled := True;
Edit2.Enabled := True;
Edit3.Enabled := True;
Edit4.Enabled := True;
Edit5.Enabled := True;
Edit6.Enabled := True;
Edit7.Enabled := True;
Edit8.Enabled := True;
Edit9.Enabled := True;
databox_setores.KeyValue := null;

end;
//campo status receber valor ativo ou inativo
if grid_for.Columns[10].Field.text = 'ATIVO' then
begin
box_status.ItemIndex := 0;

end
else
box_status.ItemIndex := 1;

//box_status.Items.Strings[box_status.ItemIndex] := (grid_for.Columns[10].Field.text);
end;

procedure TForm5.bt_fecharClick(Sender: TObject);
begin
Form5.Close;
end;

procedure TForm5.bt_minimizeClick(Sender: TObject);
begin
Form5.WindowState := WsMinimized;
end;

procedure TForm5.bt_novoClick(Sender: TObject);
begin
databox_setores.KeyValue := null;
box_tipo.ClearSelection;
box_status.ClearSelection;
databox_setores.KeyValue := null;
navi_for.BtnClick(nbInsert);
pnl_cadfor.Visible := True;
grid_for.Enabled := False;
end;

procedure TForm5.bt_salvarClick(Sender: TObject);
begin
if box_tipo.Text = 'F' then
begin
if (box_status.text = '') or (edit2.Text ='') or (box_tipo.Text = '') then
begin
ShowMessage('Preencha todos os campos!');
Abort;
end;
navi_for.BtnClick(nbPost);
pnl_cadfor.Visible := False;
grid_for.Enabled := True;

databox_setores.KeyValue := 0;
DM.up_for.Close;
DM.up_for.SQL.Clear;
DM.up_for.SQL.Add('UPDATE FCFO SET ATIVO = (:STAT), CLIFOR = (:TIPO) WHERE IDCFO = (:ID)');
DM.up_for.ParamByName('TIPO').AsString := (box_tipo.Text);
DM.up_for.ParamByName('STAT').AsString := (box_status.Text);
DM.up_for.ParamByName('ID').AsString := (edit1.Text);
DM.up_for.ExecSQL;
DM.qry_cadfor.Close;
DM.qry_cadfor.Open;
DM.qry_for.Close;
DM.qry_for.Open;
DM.cadfor.Filtered := False;
DM.cadfor.Filtered := True;
end;

if box_tipo.Text = 'C' then
begin
if (box_status.text = '') or (edit2.Text ='') or (box_tipo.Text = '') or (databox_setores.Text = '') then
begin
ShowMessage('Preencha todos os campos!');
Abort;
end;
navi_for.BtnClick(nbPost);
pnl_cadfor.Visible := False;
grid_for.Enabled := True;
with dm.up_for do
DM.up_for.Close;
DM.up_for.SQL.Clear;
DM.up_for.SQL.Add('UPDATE FCFO SET ATIVO = (:STAT), CLIFOR = (:TIPO),IDSETOR = (SELECT SETORES.IDSETOR FROM SETORES WHERE SETOR = (:ST)) WHERE IDCFO = (:ID)');
DM.up_for.ParambyName('ST').AsString := (databox_setores.Text);
DM.up_for.ParamByName('TIPO').AsString := (box_tipo.Text);
DM.up_for.ParamByName('STAT').AsString := (box_status.Text);
DM.up_for.ParamByName('ID').AsString := (edit1.Text);
DM.up_for.ExecSQL;
DM.qry_cadfor.Close;
DM.qry_cadfor.Open;
DM.qry_for.Close;
DM.qry_for.Open;
DM.cadfor.Filtered := False;
DM.cadfor.Filtered := True;
end;
end;

procedure TForm5.buscaChange(Sender: TObject);
begin
DM.qry_cadfor.Close;
DM.qry_cadfor.SQL.Clear;
DM.qry_cadfor.SQL.Add('SELECT * FROM FCFO WHERE NOME LIKE (:BUSCA) AND CLIFOR LIKE (:TIPO) ORDER BY NOME');
DM.qry_cadfor.ParamByName('BUSCA').AsString := ('%'+busca.Text+'%');
DM.qry_cadfor.ParamByName('TIPO').AsString  := ('%'+filtro_tipo.Text+'%');
DM.qry_cadfor.Open;
//DM.qry_prd.Close;
//DM.qry_prd.SQL.Clear;
//DM.qry_prd.SQL.Add('SELECT * FROM TPRD WHERE NOMEPRD LIKE (:NOMEPRD)');
//DM.qry_prd.ParamByName('NOMEPRD').AsString := ('%'+buscaprd.Text+'%');
//DM.qry_prd.Open;
end;

procedure TForm5.filtro_tipoChange(Sender: TObject);
begin
DM.qry_cadfor.Close;
DM.qry_cadfor.SQL.Clear;
DM.qry_cadfor.SQL.Add('SELECT * FROM FCFO WHERE NOME LIKE (:BUSCA) AND CLIFOR LIKE (:TIPO) ORDER BY NOME');
DM.qry_cadfor.ParamByName('BUSCA').AsString := ('%'+busca.Text+'%');
DM.qry_cadfor.ParamByName('TIPO').AsString  := ('%'+filtro_tipo.Text+'%');
DM.qry_cadfor.Open;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
DM.tb_setores.Active := True;
end;

procedure TForm5.pnl_baixoClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

procedure TForm5.pnl_cadprdClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

end.
