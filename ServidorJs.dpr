program ServidorJs;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Horse.Cors,
  System.JSON,
  DataSetConverter4D,
  DataSetConverter4D.Impl,
  Server in 'Server.pas' {DataModule1: TDataModule},
  uDm in 'src\Conexao\uDm.pas' {Dm: TDataModule},
  uAmigos in 'src\Entidades\uAmigos.pas', System.Classes;

var
  App:Thorse;
begin
  App := Thorse.Create(9000);
  App.Use(Jhonson);
  App.Use(CORS);
  app.Post('/api/cadastrar',
  procedure(Req:THorseRequest;Res:THorseResponse;Next:TProc)
  var
  jsonAmigo:TJSONObject;
  begin
    Writeln(req.Body);
    jsonAmigo := TJSONObject.Create;
    Dm        := TDm.Create(nil);
    try
      jsonAmigo                     := TJSONObject.ParseJSONValue(TEncoding
                                    .UTF8.GetBytes(req.Body),0) as TJSONObject;
      dm.qAmigo.Append;
      dm.qAmigoNOME.AsString     := jsonAmigo.GetValue<string>('nome');
      dm.qAmigoTELEFONE.AsString := jsonAmigo.GetValue<string>('numero');
      dm.qAmigo.Post;
      Writeln((TConverter.New.DataSet.Source(dm.qAmigo).AsJSONObject).ToJSON);
      res.Send((TConverter.New.DataSet.Source(dm.qAmigo).AsJSONObject).ToJSON+'Ola');
    finally
      jsonAmigo.Free;
      dm.Free;
    end;
  end);

  app.Get('/api/listar',
  procedure(Req:THorseRequest;Res:THorseResponse;Next:TProc)
  var
  jsonAmigo:TJSONObject;
  begin
    //Writeln(req.Body);
    Dm        := TDm.Create(nil);
    try
      dm.qAmigo.Close;
      dm.qAmigo.Open;
      res.Send((TConverter.New.DataSet.Source(dm.qAmigo).AsJSONArray).ToJSON);
    finally
      dm.Free;
    end;
  end);

  app.Start;
end.
