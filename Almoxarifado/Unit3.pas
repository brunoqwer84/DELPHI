unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  Tload = class(TForm)
    Label1: TLabel;
    pb: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  load: Tload;

implementation

{$R *.dfm}

uses Unit2;

procedure Tload.FormShow(Sender: TObject);
begin
Timer1.Enabled := true;

end;

procedure Tload.Timer1Timer(Sender: TObject);

begin
if (pb.Position = 100) then
PB.Position := PB.Position +10;
begin
Timer1.Enabled := False;
load.hide;
Form2.ShowModal;
load.close;
end;
end;

end.
