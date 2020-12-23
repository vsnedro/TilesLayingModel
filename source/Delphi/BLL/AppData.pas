unit AppData;
{===============================================================================
  Модуль      : AppData
  Description : Application data
  Описание    : Данные для работы приложения
===============================================================================}

interface

uses
  {App}
  Tiles;

type
  /// <summary>
  /// <para> Application data </para>
  /// <para> Данные для работы приложения </para>
  /// </summary>
  TAppData = class(TObject)
  strict private
    /// <summary> Tile Clipboard </summary>
    /// <summary> Буфер обмена для плиток </summary>
    FTilesСlipboard : TTileList;
  strict protected
    {}
  public
    /// <summary> Class constructor </summary>
    /// <summary> Конструктор класса </summary>
    constructor Create();
    /// <summary> Class destructor </summary>
    /// <summary> Деструктор класса </summary>
    destructor  Destroy(); override;

    /// <summary> Tile Clipboard </summary>
    /// <summary> Буфер обмена для плиток </summary>
    property TilesСlipboard: TTileList read FTilesСlipboard;
  end;

implementation

uses
  {VCL}
  System.SysUtils;

{------------------------------------------------------------------------------}
{ TAppData }
{------------------------------------------------------------------------------}

/// <summary> Class constructor </summary>
/// <summary> Конструктор класса </summary>
constructor TAppData.Create();
begin
  inherited Create();

  FTilesСlipboard := TTileList.Create();
end;

/// <summary> Class destructor </summary>
/// <summary> Деструктор класса </summary>
destructor TAppData.Destroy();
begin
  FreeAndNil(FTilesСlipboard);

  inherited Destroy();
end;

end.
