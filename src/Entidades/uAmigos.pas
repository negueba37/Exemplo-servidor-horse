unit uAmigos;

interface
  type TAmigos = class
  private
    FNome: string;
    FTelefone: string;
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);
    public
    published
    property Nome:string read FNome write SetNome;
    property Telefone:string read FTelefone write SetTelefone;
  end;
implementation

{ TAmigos }

uses uDm;

procedure TAmigos.SetNome(const Value: string);
begin
  FNome := Value;
  dm.memAmigos.Append;
  dm.memAmigosNOME.AsString := Value;
end;

procedure TAmigos.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
