unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask;

type
  TForm4 = class(TForm)
    bt_fechar: TSpeedButton;
    pnl_cadprd: TPanel;
    Label1: TLabel;
    Image1: TImage;
    bt_minimize: TSpeedButton;
    pnl_baixo: TPanel;
    grid_prd: TDBGrid;
    buscaprd: TEdit;
    botoes: TDBNavigator;
    Label2: TLabel;
    pnl_cad: TPanel;
    Edit1: TDBEdit;
    Edit2: TDBEdit;
    Edit3: TDBEdit;
    Edit5: TDBEdit;
    Edit6: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    box_status: TComboBox;
    Label6: TLabel;
    procedure bt_minimizeClick(Sender: TObject);
    procedure bt_fecharClick(Sender: TObject);
    procedure buscaprdChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure pnl_cadprdClick(Sender: TObject);
    procedure pnl_baixoClick(Sender: TObject);
    procedure grid_prdDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit2;


//bot�o fechar
procedure TForm4.bt_fecharClick(Sender: TObject);
begin
Form4.Close;
end;

//bot�o minimizar
procedure TForm4.bt_minimizeClick(Sender: TObject);
begin
Form4.WindowState := WsMinimized;
end;

//filtra tabela pelo campo de busca para aparecer no grid
procedure TForm4.buscaprdChange(Sender: TObject);
begin
DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT * FROM TPRD WHERE NOMEPRD LIKE (:NOMEPRD)');
DM.qry_prd.ParamByName('NOMEPRD').AsString := ('%'+buscaprd.Text+'%');
DM.qry_prd.Open;
//DM.tprd.Filtered := false;
//DM.tprd.Filter   := 'Upper(NOMEPRD) like' + QuotedStr(AnsiUpperCase('%'+buscaprd.Text+'%'));
//DM.tprd.Filtered := true;
end;

//cancela altera��es na base ao clicar no bot�o cancelar
procedure TForm4.Button1Click(Sender: TObject);
begin
botoes.BtnClick(nbCancel);
pnl_cad.Visible := False;
grid_prd.Enabled := True;
buscaprd.Enabled := True;
end;

//valida��es ao salvar produto novo ou modifica��o
procedure TForm4.Button2Click(Sender: TObject);
begin
if (Edit2.Text = '') or (Edit3.Text = '') or (box_status.Text = '')
then
begin
ShowMessage('Preencha todos os campos');
end
else
begin
botoes.BtnClick(nbPost);
pnl_cad.Visible := False;
grid_prd.Enabled := True;
buscaprd.Enabled := True;
with dm.up_status_prd do
DM.up_status_prd.Close;
DM.up_status_prd.SQL.Clear;
DM.up_status_prd.SQL.Add('UPDATE TPRD SET STATUS = (:STAT),DATAMOD = (:DATE) WHERE IDPRD = (:ID)');
DM.up_status_prd.ParamByName('STAT').AsString := (box_status.Text);
DM.up_status_prd.ParamByName('ID').AsString := (edit1.Text);
DM.up_status_prd.ParamByName('DATE').AsDateTime := Now;
DM.up_status_prd.ExecSQL;

DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT * FROM TPRD WHERE NOMEPRD LIKE (:NOMEPRD) ORDER BY NOMEPRD');
DM.qry_prd.ParamByName('NOMEPRD').AsString := ('%'+buscaprd.Text+'%');
DM.qry_prd.Open;
end
end;

//ao inserir produto zera os campos 'estoque' e 'valor'
procedure TForm4.Button3Click(Sender: TObject);
begin
botoes.BtnClick(nbInsert);
pnl_cad.Visible  := True;
grid_prd.Enabled := False;
buscaprd.Enabled := false;
Edit5.Text := '0'   ;
Edit6.Text := '0,00';
box_status.ItemIndex := 0;
end;

//ao clicar em editar produto
procedure TForm4.Button4Click(Sender: TObject);
begin
botoes.BtnClick(nbEdit);
pnl_cad.Visible  := True;
grid_prd.Enabled := False;
buscaprd.Enabled := false;
if grid_prd.Columns[3].Field.text = 'ATIVO' then
begin
box_status.ItemIndex := 0;
end;
if grid_prd.Columns[3].Field.text = 'INATIVO' then
begin
box_status.ItemIndex := 1;
end;


end;

procedure TForm4.grid_prdDblClick(Sender: TObject);
begin
Button4.Click;
end;

procedure TForm4.pnl_baixoClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

procedure TForm4.pnl_cadprdClick(Sender: TObject);
begin
form2.pnl_mov.Visible := False;
form2.pnl_rel.Visible := False;
form2.pnl_cad.Visible := False;
end;

end.