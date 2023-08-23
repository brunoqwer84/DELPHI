unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.WinXCtrls, IniFiles, ACBrBase,
  ACBrDFe, ACBrNFe;

type
  Tprincipal = class(TForm)
    btlogin: TButton;
    btcancelar: TButton;
    user: TEdit;
    passwd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    valido: TDBEdit;
    Label3: TLabel;
    Image2: TImage;
    Label4: TLabel;
    procedure btcancelarClick(Sender: TObject);
    procedure btloginClick(Sender: TObject);
    procedure passwdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  principal: Tprincipal;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3;

procedure Tprincipal.btcancelarClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tprincipal.btloginClick(Sender: TObject);
begin
with dm.qrylogin do
dm.qrylogin.Close;
dm.qrylogin.SQL.Clear;
dm.qrylogin.SQL.Add ('SELECT COUNT(1) FROM usuarios WHERE user = (:user) and (SELECT CAST(AES_DECRYPT(senha,"caneta11@") as char) from usuarios WHERE user = (:user)) = (:passwd) and USUARIOS.STATUS <> "INATIVO" ');
dm.qrylogin.ParamByName('user').AsString := (user.Text);
dm.qrylogin.ParamByName('passwd').AsString := (passwd.Text);
dm.qrylogin.Open;
if valido.text = '1' then
begin
//load.hide;
//load.close;
principal.Hide;
load.ShowModal;
//form2.ShowModal;
principal.Close;
end
else
begin
ShowMessage('Usuário ou senha incorretos');
passwd.Text:= '';
end;

end;

procedure Tprincipal.FormShow(Sender: TObject);
var
INI: TIniFile;
begin
 try
    with DM.conexao do
      begin
      INI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
        DM.conexao.Params.Clear;
        DM.conexao.Params.Values['DriverID']  := INI.ReadString('SQLSERVER','DriverID','ERRO');
        DM.conexao.Params.Values['Server'] :=    INI.ReadString('SQLSERVER','Server','ERRO');
        DM.conexao.Params.Values['Database'] :=  INI.ReadString('SQLSERVER','Database','ERRO');
        DM.conexao.Params.Values['User_name'] := INI.ReadString('SQLSERVER','User_Name','ERRO');
        DM.conexao.Params.Values['Password'] :=  INI.ReadString('SQLSERVER','Password','ERRO');
        DM.conexao.Params.Values['LoginTimeout'] := INI.ReadString('SQLSERVER','LoginTimeout','ERRO');
        DM.conexao.Params.Values['ReadTimeout']  := INI.ReadString('SQLSERVER','ReadTimeout','ERRO');
        DM.conexao.Params.Values['WriteTimeout'] := INI.ReadString('SQLSERVER','WriteTimeout','ERRO');
        DM.conexao.Connected := True;
        INI.Free;
        user.SetFocus;
      end;
  except
      ShowMessage('Ocorreu uma falha na conexão com o Banco de dados MySQL, Verifique arquivo "Config.ini" !');
      Application.Terminate;
end;
end;

procedure Tprincipal.passwdKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
btlogin.Click;
end;
end;
end.
