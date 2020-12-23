unit FmMain;
{===============================================================================
  Unit        : FmMain
  Description : Main application form
  Описание    : Главная форма приложения
===============================================================================}

interface

uses
  {VCL}
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdActns,
  {DevExpress}
  dxBar,
  cxClasses,
  cxImageList,
  cxGraphics,
  cxLookAndFeels,
  {App}
  AppApi;

type
  /// <summary>
  /// <para> Main application form </para>
  /// <para> Главная форма приложения </para>
  /// </summary>
  TFm_Main = class(TForm)
    {$REGION ' Components '}
    cxLFC_1: TcxLookAndFeelController;
    AL_1: TActionList;
    cxIL_1: TcxImageList;
    MM_Main: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    dxBrMr_Menu: TdxBarManager;
    dxBar_Main: TdxBar;
    dxBarBtn_New: TdxBarButton;
    Act_New: TAction;
    Act_Open: TAction;
    Act_Close: TAction;
    dxBarBtn_Open: TdxBarButton;
    dxBarBtn_Close: TdxBarButton;
    N2: TMenuItem;
    N7: TMenuItem;
    Act_About: TAction;
    WindowClose: TWindowClose;
    WindowCascade: TWindowCascade;
    WindowTileHorizontal: TWindowTileHorizontal;
    WindowTileVertical: TWindowTileVertical;
    WindowMinimizeAll: TWindowMinimizeAll;
    WindowArrange: TWindowArrange;
    WindowCloseAll: TWindowAction;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    {$ENDREGION}
    {$REGION ' Form events '}
    /// <summary> Create a window </summary>
    /// <summary> Создание окна </summary>
    procedure FormCreate(Sender: TObject);
    /// <summary> Destroying a window </summary>
    /// <summary> Уничтожение окна </summary>
    procedure FormDestroy(Sender: TObject);
    {$ENDREGION}
    {$REGION ' Actions '}
    /// <summary> Create new field </summary>
    /// <summary> Создать новое поле </summary>
    procedure Act_NewExecute(Sender: TObject);
    /// <summary> Load field from file </summary>
    /// <summary> Загрузить поле из файла </summary>
    procedure Act_OpenExecute(Sender: TObject);
    /// <summary> About the program </summary>
    /// <summary> О программе </summary>
    procedure Act_AboutExecute(Sender: TObject);
    /// <summary> Exit </summary>
    /// <summary> Выход </summary>
    procedure Act_CloseExecute(Sender: TObject);

    /// <summary> Close all child windows </summary>
    /// <summary> Закрыть все дочерние окна </summary>
    procedure WindowCloseAllExecute(Sender: TObject);
    {$ENDREGION}
  strict private
    /// <summary> The software part of the application </summary>
    /// <summary> Программная часть приложения </summary>
    FAppApi : TAppApi;

    /// <summary> Action availability </summary>
    /// <summary> Доступность действий </summary>
    procedure AdjustActions();
  strict protected
    {}
  public
    /// <summary> Initialization </summary>
    /// <summary> Инициализация </summary>
    procedure Init(
      AAppApi : TAppApi);
  end; { TFm_Main }

var
  Fm_Main: TFm_Main;

implementation

uses
  {App}
  Tiles,
  FmLayer,
  FmAbout;

{$R *.dfm}

{------------------------------------------------------------------------------}
{ TFm_Main }
{------------------------------------------------------------------------------}

/// <summary> Initialization </summary>
/// <summary> Инициализация </summary>
procedure TFm_Main.Init(
  AAppApi: TAppApi);
begin
  FAppApi := AAppApi;
end;

{$REGION ' Form events '}
/// <summary> Create a window </summary>
/// <summary> Создание окна </summary>
procedure TFm_Main.FormCreate(Sender: TObject);
begin
  inherited;
end;

/// <summary> Destroying a window </summary>
/// <summary> Уничтожение окна </summary>
procedure TFm_Main.FormDestroy(Sender: TObject);
begin
  FAppApi := nil;

  inherited;
end;
{$ENDREGION}

{$REGION ' Actions '}
/// <summary> Create new field </summary>
/// <summary> Создать новое поле </summary>
procedure TFm_Main.Act_NewExecute(Sender: TObject);
var
  Fm : TFm_Layer;
begin
  Fm := TFm_Layer.Create(Self, FAppApi, TTileList.Create());
  Fm.Show();

  AdjustActions();
end;

/// <summary> Load field from file </summary>
/// <summary> Загрузить поле из файла </summary>
procedure TFm_Main.Act_OpenExecute(Sender: TObject);
var
  S     : String;
  OD    : TOpenDialog;
  Load  : Boolean;
  Tiles : TTileList;
  Fm    : TFm_Layer;
begin
  OD := TOpenDialog.Create(nil);
  try
    // display the file open dialog
    // выводим диалог открытия файла
    OD.DefaultExt := 'dat';
    OD.Filter     := 'Файлы данных (*.dat)|*.dat|' + 'Все файлы|*.*|';
    OD.Options    := OD.Options +
      [ofPathMustExist, ofFileMustExist, ofEnableSizing];

    // if file is selected
    // если файл выбран
    Load := OD.Execute();
    if Load then
      S := OD.FileName;
  finally
    FreeAndNil(OD);
  end;

  // if file is selected
  // если файл выбран
  if Load then
  begin
    Self.Enabled  := False;
    Screen.Cursor := crHourGlass;
    try
      // load data
      // загружаем данные
      Tiles := FAppApi.LoadTiles(S);
      Fm    := TFm_Layer.Create(Self, FAppApi, Tiles, S);
      Fm.Show();
    finally
      Screen.Cursor := crDefault;
      Self.Enabled  := True;
    end;
  end;

  AdjustActions();
end;

/// <summary> About the program </summary>
/// <summary> О программе </summary>
procedure TFm_Main.Act_AboutExecute(Sender: TObject);
var
  Fm : TFm_About;
begin
  Fm := TFm_About.Create(nil);
  try
    Fm.ShowModal();
  finally
    FreeAndNil(Fm);
  end;

  AdjustActions();
end;

/// <summary> Exit </summary>
/// <summary> Выход </summary>
procedure TFm_Main.Act_CloseExecute(Sender: TObject);
begin
  Close();
end;

/// <summary> Close all child windows </summary>
/// <summary> Закрыть все дочерние окна </summary>
procedure TFm_Main.WindowCloseAllExecute(Sender: TObject);
var
  i : Integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Free();
end;
{$ENDREGION}

/// <summary> Action availability </summary>
/// <summary> Доступность действий </summary>
procedure TFm_Main.AdjustActions();
begin
  {}
end;

end.
