unit Unit1;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, frxClass, frxDBSet, frxRich, Datasnap.DBClient,
  Soap.SOAPConn;

type
  TDM = class(TDataModule)
    dslogin: TDataSource;
    qrylogin: TFDQuery;
    conexao: TFDConnection;
    dsprd: TDataSource;
    up_status_prd: TFDQuery;
    cadfor: TFDTable;
    dsfor: TDataSource;
    up_for: TFDQuery;
    tb_setores: TFDTable;
    ds_setor: TDataSource;
    tb_setoresIDSETOR: TIntegerField;
    tb_setoresSETOR: TStringField;
    ds_tmov: TDataSource;
    qry_insertprd: TFDQuery;
    ds_titmmov: TDataSource;
    qry_idmov1: TFDQuery;
    qry_clifor: TFDQuery;
    ds_clifor: TDataSource;
    ds_id_mais1: TDataSource;
    qry_uptmov: TFDQuery;
    ds_uptmov: TDataSource;
    tb_titmmov: TFDTable;
    qry_idmov: TFDQuery;
    ds_idmov: TDataSource;
    qry_tmov: TFDQuery;
    qry_estoque_atual: TFDQuery;
    ds_estoque: TDataSource;
    qry_mov_completo: TFDQuery;
    ds_mov_completo: TDataSource;
    qry_for: TFDQuery;
    ds_for: TDataSource;
    qry_itementrada: TFDQuery;
    ds_itementrada: TDataSource;
    ds_usuarios: TDataSource;
    qry_usuarios: TFDQuery;
    qry_incluiuser: TFDQuery;
    qry_usuariosID: TFDAutoIncField;
    qry_usuariosUSUÁRIO: TStringField;
    qry_usuariosGRUPO: TStringField;
    qry_usuariosSTATUS: TStringField;
    rel_consumo: TfrxReport;
    data_consumo: TfrxDBDataset;
    qry_rel: TFDQuery;
    ds_rel: TDataSource;
    qry_prd: TFDQuery;
    qry_setores: TFDQuery;
    ds_setores: TDataSource;
    qry_setoresSETOR: TStringField;
    qry_cadfor: TFDQuery;
    qry_editamov: TFDQuery;
    ds_editamov: TDataSource;
    cadforIDCFO: TFDAutoIncField;
    cadforNOME: TStringField;
    cadforCLIFOR: TStringField;
    cadforCNPJ: TStringField;
    cadforRUA: TStringField;
    cadforNUMERO: TIntegerField;
    cadforBAIRRO: TStringField;
    cadforCIDADE: TStringField;
    cadforESTADO: TStringField;
    cadforTEL: TStringField;
    cadforATIVO: TStringField;
    cadforIDSETOR: TIntegerField;
    qry_cadforIDCFO: TFDAutoIncField;
    qry_cadforNOME: TStringField;
    qry_cadforCLIFOR: TStringField;
    qry_cadforCNPJ: TStringField;
    qry_cadforRUA: TStringField;
    qry_cadforNUMERO: TIntegerField;
    qry_cadforBAIRRO: TStringField;
    qry_cadforCIDADE: TStringField;
    qry_cadforESTADO: TStringField;
    qry_cadforTEL: TStringField;
    qry_cadforATIVO: TStringField;
    qry_cadforIDSETOR: TIntegerField;
    verifica_dup: TFDQuery;
    qry_setoresIDSETOR: TFDAutoIncField;
    tb_titmmovPK: TFDAutoIncField;
    tb_titmmovIDMOV: TIntegerField;
    tb_titmmovNOMEPRD: TStringField;
    tb_titmmovQUANTIDADE: TIntegerField;
    tb_titmmovIDPRD: TIntegerField;
    rel_estoque: TfrxReport;
    data_estoque: TfrxDBDataset;
    qry_est: TFDQuery;
    ds_est: TDataSource;
    qry_prdIDPRD: TFDAutoIncField;
    qry_prdNOMEPRD: TStringField;
    qry_prdUNIDADE: TStringField;
    qry_prdSTATUS: TStringField;
    qry_prdESTMIN: TIntegerField;
    qry_prdESTOQUE: TIntegerField;
    qry_prdDATAMOD: TDateField;
    qry_prdVLUNIT: TBCDField;
    rel_sgt: TfrxReport;
    data_sgt: TfrxDBDataset;
    qry_sgt: TFDQuery;
    ds_sgt: TDataSource;
    data_entradas: TfrxDBDataset;
    qry_entradas: TFDQuery;
    ds_entradas: TDataSource;
    rel_entradas: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
