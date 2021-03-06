unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.DApt;

type
  TDm = class(TDataModule)
    memAmigos: TFDMemTable;
    memAmigosNOME: TStringField;
    memAmigosTELEFONE: TStringField;
    ConexaoFB: TFDConnection;
    qAmigo: TFDQuery;
    qAmigoNOME: TWideStringField;
    qAmigoTELEFONE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  qAmigo.Open();
  memAmigos.Open;
  memAmigos.EmptyDataSet;
end;

end.
