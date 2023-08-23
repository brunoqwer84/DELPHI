unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Mask,
  Vcl.DBCtrls;

type
  Tusuarios = class(TForm)
    grid_user: TDBGrid;
    bt_incluir: TButton;
    bt_altsenha: TButton;
    pnl_users: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    box_status: TComboBox;
    pnl_cadprd: TPanel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    edit_user: TDBEdit;
    edit_senha: TEdit;
    botoes: TDBNavigator;
    edit_id: TDBEdit;
    id: TLabel;
    box_grupo: TComboBox;
    GRUPO: TLabel;
    procedure bt_fecharClick(Sender: TObject);
    procedure bt_incluirClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bt_altsenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  usuarios: Tusuarios;

implementation

{$R *.dfm}

uses Unit1;

procedure Tusuarios.bt_altsenhaClick(Sender: TObject);
begin
botoes.BtnClick(nbEdit);
pnl_users.Visible := True;
edit_senha.Text := '';
edit_user.Enabled := false;
edit_senha.SetFocus;
grid_user.Enabled := False;
if grid_user.Columns[3].Field.text = 'ATIVO' then
begin
box_status.ItemIndex := 0;
end;
if grid_user.Columns[3].Field.text = 'INATIVO' then
begin
box_status.ItemIndex := 1;
end;

if grid_user.Columns[2].Field.text = 'ADMINISTRADORES' then
begin
box_grupo.ItemIndex := 1;
end;
if grid_user.Columns[2].Field.text = 'PADRAO' then
begin
box_grupo.ItemIndex := 0;
end;

end;

procedure Tusuarios.bt_fecharClick(Sender: TObject);
begin
usuarios.Close;
end;

procedure Tusuarios.bt_incluirClick(Sender: TObject);
begin
botoes.BtnClick(nbInsert);
pnl_users.Visible := True;
edit_user.Enabled := True;
edit_senha.Text := '';
box_grupo.Text := '';
edit_user.SetFocus;
grid_user.Enabled := False;
end;

procedure Tusuarios.Button1Click(Sender: TObject);
begin
if (edit_user.Text = '') or (box_status.Text = '') OR (box_grupo.Text = '')
then
begin
ShowMessage('Preencha todos os campos');
end
else
begin
botoes.BtnClick(nbPost);
pnl_users.Visible := False;
grid_user.Enabled := True;
with DM.qry_incluiuser do
if edit_senha.Text = '' then
begin
DM.qry_incluiuser.Close;
DM.qry_incluiuser.SQL.Clear;
DM.qry_incluiuser.SQL.Add('UPDATE USUARIOS SET STATUS = (:STAT),GRUPO = (:GP), USER = (:USER) WHERE IDUSER = (:ID)');
DM.qry_incluiuser.ParamByName('STAT').AsString := (box_status.Text);
DM.qry_incluiuser.ParamByName('ID').AsString := (edit_id.Text);
DM.qry_incluiuser.ParamByName('USER').AsString := (edit_user.Text);
DM.qry_incluiuser.ParamByName('GP').AsString := (box_grupo.Text);
DM.qry_incluiuser.ExecSQL;
DM.qry_usuarios.Close;
DM.qry_usuarios.Open;
ShowMessage('Opera��o realizada com sucesso!');
grid_user.Enabled := True;
end;
if edit_senha.Text <> '' then
begin
DM.qry_incluiuser.Close;
DM.qry_incluiuser.SQL.Clear;
DM.qry_incluiuser.SQL.Add('UPDATE USUARIOS SET STATUS = (:STAT),GRUPO = (:GP), USER = (:USER), SENHA = AES_ENCRYPT((:SN), "caneta11@") WHERE IDUSER = (:ID)');
DM.qry_incluiuser.ParamByName('STAT').AsString := (box_status.Text);
DM.qry_incluiuser.ParamByName('ID').AsString := (edit_id.Text);
DM.qry_incluiuser.ParamByName('USER').AsString := (edit_user.Text);
DM.qry_incluiuser.ParamByName('SN').AsString := (edit_senha.Text);
DM.qry_incluiuser.ParamByName('GP').AsString := (box_grupo.Text);
DM.qry_incluiuser.ExecSQL;
DM.qry_usuarios.Close;
DM.qry_usuarios.Open;
ShowMessage('Opera��o realizada com sucesso!');
grid_user.Enabled := True;
end;
end
end;

procedure Tusuarios.Button2Click(Sender: TObject);
begin
botoes.BtnClick(nbCancel);
pnl_users.Visible := False;
grid_user.Enabled := True;
end;

end.
