unit Unit18;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm18 = class(TForm)
    campo: TEdit;
    grid_src: TDBGrid;
    Label1: TLabel;
    procedure campoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses Unit1, Unit10;

procedure TForm18.campoChange(Sender: TObject);
begin
DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT * FROM TPRD WHERE NOMEPRD LIKE (:NOMEPRD) ORDER BY NOMEPRD ASC');
DM.qry_prd.ParamByName('NOMEPRD').AsString := ('%'+campo.Text+'%');
DM.qry_prd.Open;
end;

procedure TForm18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
campo.text :='';
tela_lanca_saida.enabled := true;
//tela_lanca_saida.combo_prd.Field.FieldName := grid_src.Columns[0].Field.text;
DM.qry_prd.Close;
DM.qry_prd.SQL.Clear;
DM.qry_prd.SQL.Add('SELECT *  FROM TPRD ORDER BY NOMEPRD ASC');
DM.qry_prd.Open;
end;

procedure TForm18.FormShow(Sender: TObject);
begin
tela_lanca_saida.enabled := false;
end;

end.
