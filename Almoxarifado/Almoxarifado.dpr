program Almoxarifado;

uses
  Vcl.Forms,
  Unit8 in 'Unit8.pas' {principal},
  Unit1 in 'Unit1.pas' {DM: TDataModule},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {load},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {tela_lanca_saida},
  Unit11 in 'Unit11.pas' {entradas},
  Unit12 in 'Unit12.pas' {usuarios},
  Unit13 in 'Unit13.pas' {edita_mov},
  Unit14 in 'Unit14.pas' {insere_item},
  Unit15 in 'Unit15.pas' {insere_item_saida},
  Unit16 in 'Unit16.pas' {filtros_consumo},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {filtra_entrada};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tprincipal, principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(Tload, load);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(Ttela_lanca_saida, tela_lanca_saida);
  Application.CreateForm(Tentradas, entradas);
  Application.CreateForm(Tusuarios, usuarios);
  Application.CreateForm(Tedita_mov, edita_mov);
  Application.CreateForm(Tinsere_item, insere_item);
  Application.CreateForm(Tinsere_item_saida, insere_item_saida);
  Application.CreateForm(Tfiltros_consumo, filtros_consumo);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(Tfiltra_entrada, filtra_entrada);
  Application.Run;
end.
