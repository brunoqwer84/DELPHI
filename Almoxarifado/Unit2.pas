unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.ComCtrls, Vcl.WinXPickers,
  dxGDIPlusClasses, ACBrBase, ACBrDFe, ACBrNFe;

type
  TForm2 = class(TForm)
    pnl_principal: TPanel;
    pnl_superior: TPanel;
    bt_fechar: TSpeedButton;
    bt_minimize: TSpeedButton;
    pnl_separa: TPanel;
    label_sistema: TLabel;
    pnl_menus: TPanel;
    pnl_mov: TPanel;
    bt_entrada: TSpeedButton;
    bt_saida: TSpeedButton;
    bt_rel: TSpeedButton;
    bt_mov: TSpeedButton;
    bt_cad: TSpeedButton;
    pnl_cad: TPanel;
    bt_cadfornece: TSpeedButton;
    bt_cadprod: TSpeedButton;
    pnl_rel: TPanel;
    bt_estoque: TSpeedButton;
    bt_entradas: TSpeedButton;
    bt_setor: TSpeedButton;
    bt_consumo: TSpeedButton;
    bt_sugestao: TSpeedButton;
    bt_user: TSpeedButton;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    usuario_logado: TLabel;
    procedure CreateParams(var Params : TCreateParams); override;
    procedure bt_fecharClick(Sender: TObject);
    procedure bt_minimizeClick(Sender: TObject);
    procedure bt_movClick(Sender: TObject);
    procedure pnl_principalClick(Sender: TObject);
    procedure bt_cadClick(Sender: TObject);
    procedure bt_relClick(Sender: TObject);
    procedure pnl_menusClick(Sender: TObject);
    procedure pnl_superiorClick(Sender: TObject);
    procedure bt_userClick(Sender: TObject);
    procedure bt_cadprodClick(Sender: TObject);
    procedure bt_cadforneceClick(Sender: TObject);
    procedure bt_setorClick(Sender: TObject);
    procedure bt_saidaClick(Sender: TObject);
    procedure bt_entradaClick(Sender: TObject);
    procedure bt_consumoClick(Sender: TObject);
    procedure pnl_superiorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bt_estoqueClick(Sender: TObject);
    procedure bt_sugestaoClick(Sender: TObject);
    procedure bt_entradasClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure label_sistemaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit4, Unit5, Unit6, Unit9, Unit7, Unit12, Unit8, Unit1, Unit16, Unit19;
//FUN��O PARA DETECTAR TECLA PRESSIONADA NO TECLADO
function KeyIsDown(const Key: integer): boolean;
  begin
  Result := GetKeyState(Key) and 128 > 0;
  end;

//mostrar icone na barra de trefas apos login
procedure TForm2.CreateParams(var Params : TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle  := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

 procedure TForm2.FormShow(Sender: TObject);
begin
usuario_logado.Caption := principal.user.Text;
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
end;



procedure TForm2.label_sistemaClick(Sender: TObject);
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
end;

procedure TForm2.bt_cadClick(Sender: TObject);
begin
pnl_cad.Visible := True;
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.BringToFront;
end;

procedure TForm2.bt_cadforneceClick(Sender: TObject);
begin
form5.Parent := pnl_principal;
form5.Align :=AlClient;
form5.Show;
pnl_cad.Visible := False;
end;

procedure TForm2.bt_cadprodClick(Sender: TObject);
begin
form4.Parent := pnl_principal;
form4.Align :=AlClient;
form4.Show;
pnl_cad.Visible := False;
DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT *  FROM TPRD ORDER BY NOMEPRD');
DM.qry_prd.Open;
form4.buscaprd.Text := '';
end;

procedure TForm2.bt_consumoClick(Sender: TObject);
begin
    if KeyIsDown(VK_CONTROL) and KeyIsDown(VK_SHIFT) then
    begin
    DM.rel_consumo.DesignReport;
    end
    else
    begin
    pnl_rel.Visible := False;
    filtros_consumo.ShowModal;
    end;

end;

procedure TForm2.bt_entradaClick(Sender: TObject);
begin
form7.Parent := pnl_principal;
form7.Align :=AlClient;
form7.Show;
pnl_mov.Visible := False;

//limpa o grid ao abrir os forms
DM.qry_mov_completo.Close;
dm.qry_tmov.Close;
end;

procedure TForm2.bt_entradasClick(Sender: TObject);
begin
DM.qry_for.Close;
DM.qry_for.Open;
filtra_entrada.ShowModal;
pnl_rel.Visible := False;
{DM.qry_entradas.Close;
DM.qry_entradas.Open;
    if KeyIsDown(VK_CONTROL) and KeyIsDown(VK_SHIFT) then
    begin
    DM.rel_entradas.DesignReport;
    pnl_rel.Visible := False;
    end
    else
    begin
    DM.rel_entradas.ShowReport;
    pnl_rel.Visible := False;
    end;}
end;

//SE PRESSIONADO CONTROL+SHIFT EDITA RELATORIO ESTOQUE
procedure TForm2.bt_estoqueClick(Sender: TObject);
  begin
  DM.qry_est.Close;
  DM.qry_est.Open;
    if KeyIsDown(VK_CONTROL) and KeyIsDown(VK_SHIFT) then
    begin
    DM.rel_estoque.DesignReport;
    pnl_rel.Visible := False;
    end
    else
    begin
    DM.rel_estoque.ShowReport;
    pnl_rel.Visible := False;
    end;
  end;

procedure TForm2.bt_fecharClick(Sender: TObject);
begin
if MessageBox(HANDLE, 'Deseja fechar o programa ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = idyes then
begin
Form2.Close;
end;
end;

procedure TForm2.bt_minimizeClick(Sender: TObject);
begin
Form2.WindowState := wsMinimized;
end;

procedure TForm2.bt_relClick(Sender: TObject);
begin
pnl_rel.Visible := True;
pnl_mov.Visible := False;
pnl_cad.Visible := False;
pnl_rel.BringToFront;
end;

procedure TForm2.bt_saidaClick(Sender: TObject);
begin
form9.Parent := pnl_principal;
form9.Align :=AlClient;
form9.Show;
pnl_mov.Visible := False;
DM.qry_mov_completo.Close;
dm.qry_tmov.Close;
end;

procedure TForm2.bt_setorClick(Sender: TObject);
begin
form6.Parent := pnl_principal;
form6.Align :=AlClient;
form6.Show;
pnl_cad.Visible := False;
DM.qry_setores.Close;
DM.qry_setores.SQL.Clear;
DM.qry_setores.SQL.Add('SELECT * FROM SETORES ORDER BY SETOR');
DM.qry_setores.Open;

end;

procedure TForm2.bt_sugestaoClick(Sender: TObject);
begin
DM.qry_sgt.Close;
DM.qry_sgt.Open;
    if KeyIsDown(VK_CONTROL) and KeyIsDown(VK_SHIFT) then
    begin
    DM.rel_sgt.DesignReport;
    pnl_rel.Visible := False;
    end
    else
    begin
    DM.rel_sgt.ShowReport;
    pnl_rel.Visible := False;
    end;

end;

procedure TForm2.bt_userClick(Sender: TObject);
begin
DM.qry_incluiuser.Close;
DM.qry_incluiuser.SQL.Clear;
DM.qry_incluiuser.SQL.Add('SELECT IDUSER FROM USUARIOS WHERE USER = (:user) AND GRUPO = "ADMINISTRADORES"');
DM.qry_incluiuser.ParamByName('user').AsString := (principal.user.Text);
DM.qry_incluiuser.Open;
DM.qry_usuarios.Open;
if dm.qry_incluiuser.IsEmpty then
begin
ShowMessage('Sem Permiss�o!');
end
else
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
usuarios.Show;
usuarios.Parent := pnl_principal;
usuarios.Align :=AlClient;
end
end;


procedure TForm2.pnl_menusClick(Sender: TObject);
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
end;

procedure TForm2.pnl_principalClick(Sender: TObject);
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
end;

procedure TForm2.pnl_superiorClick(Sender: TObject);
begin
pnl_mov.Visible := False;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
end;


//permitir mover o form2 clicando no painel superior
procedure TForm2.pnl_superiorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
[color=green:d862e6f8c7]const
SC_DRAGMOVE = $F012;
begin
if Button = mbleft then
begin
ReleaseCapture;
Form2.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;
end;

procedure TForm2.bt_movClick(Sender: TObject);
begin
pnl_mov.Visible := True;
pnl_rel.Visible := False;
pnl_cad.Visible := False;
pnl_mov.BringToFront;
end;

end.
