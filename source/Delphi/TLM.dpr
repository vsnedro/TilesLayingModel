program TLM;
{===============================================================================
  Project     : TLM
  Description : Model tile laying system project
  Описание    : Проект "Модельная система укладки плитки"
===============================================================================}

uses
  Vcl.Forms,
  System.SysUtils,
  Winapi.Windows,
  AppTypes in 'BLL\AppTypes.pas',
  AppConsts in 'BLL\AppConsts.pas',
  AppData in 'BLL\AppData.pas',
  Tiles in 'BLL\Tiles.pas',
  TileRepository in 'DAL\TileRepository.pas',
  AppApi in 'BLL\AppApi.pas',
  FmLayer in 'UIL\FmLayer.pas' {Fm_Layer},
  FmAbout in 'UIL\FmAbout.pas' {Fm_About},
  FmMain in 'UIL\FmMain.pas' {Fm_Main};

{$R *.res}

var
  AppData : TAppData;
  AppApi  : TAppApi;

begin
  Application.Initialize();
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Model tile laying system';

  try
    // create common data for the application
    // создаём общие данные для работы приложения
    AppData := TAppData.Create();
    try
      // creating the software part of the application
      // создаём программную часть приложения
      AppApi := TAppApi.Create(AppData);
      try
        // create the main application form
        // создаём главную форму приложения
        Application.CreateForm(TFm_Main, Fm_Main);
        Fm_Main.Init(AppApi);
        Application.Run();
      finally
        FreeAndNil(AppApi);
      end;
    finally
      FreeAndNil(AppData);
    end;
  except
    on E: Exception do
      Application.MessageBox(
        PChar('An application error has occurred.' + sLineBreak + E.Message),
        PChar('Error!'),
        MB_ICONERROR + MB_OK);
  end;
end.
