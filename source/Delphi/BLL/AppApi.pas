unit AppApi;
{===============================================================================
  Модуль   : AppApi
  Описание : Программная часть приложения
===============================================================================}

interface

uses
  {VCL}
  System.Types,
  System.UITypes,
  {App}
  AppTypes,
  AppConsts,
  AppData,
  Tiles,
  TileRepository;

type
  /// <summary>
  /// <para> The software part of the application </para>
  /// <para> Программная часть приложения </para>
  /// </summary>
  TAppApi = class(TObject)
  strict private
  const
    /// <summary> Angle of rotation (degrees) </summary>
    /// <summary> Угол поворота (градусы) </summary>
    CRotateAngle = 5;
  strict private
    /// <summary> Application data </summary>
    /// <summary> Данные для работы приложения </summary>
    FAppData        : TAppData;
    /// <para> Tile repository </para>
    /// <summary> Репозиторий. Плитки </summary>
    FTileRepository : TTileFileRepository;
   strict protected
    /// <summary> Rotate selected tiles by angle </summary>
    /// <summary> Повернуть выбранные плитки на угол </summary>
    procedure RotateSelectedTiles(
      const AList  : TTileList;
      const AAngle : Integer);

    /// <summary> Set tile coordinates </summary>
    /// <summary> Задать координаты для плитки </summary>
    procedure SetCoordsForTile(
      const ATile : TTile);
    /// <summary> Set coordinates for the Triangle tile </summary>
    /// <summary> Задать координаты для плитки Треугольник </summary>
    procedure SetCoordsForTriangle(
      const ATile : TTile);
    /// <summary> Set coordinates for the Square tile </summary>
    /// <summary> Задать координаты для плитки Квадрат </summary>
    procedure SetCoordsForSquare(
      const ATile : TTile);
    /// <summary> Set coordinates for Hexagon tile </summary>
    /// <summary> Задать координаты для плитки Шестиугольник </summary>
    procedure SetCoordsForHexagon(
      const ATile : TTile);
    /// <summary> Set coordinates for Octagon tile </summary>
    /// <summary> Задать координаты для плитки Восьмиугольник </summary>
    procedure SetCoordsForOctagon(
      const ATile : TTile);
  public
    /// <summary> Class constructor </summary>
    /// <summary> Конструктор класса </summary>
    constructor Create(
      const AAppData : TAppData);
   /// <summary> Class destructor </summary>
   /// <summary> Деструктор класса </summary>
    destructor  Destroy(); override;

    /// <summary> Create tile and add to list </summary>
    /// <summary> Создать плитку и добавить в список </summary>
    function  CreateTile(
      const AKind     : TTileKind;
      const AColor    : TColor;
      const ARect     : TRect;
      const AAngle    : Integer = 0;
      const ASelected : Boolean = False) : TTile;

    /// <summary> Rotate selected tiles to the left </summary>
    /// <summary> Повернуть выбранные плитки влево </summary>
    procedure RotateLeftSelectedTiles(
      const AList : TTileList);
    /// <summary> Rotate selected tiles to the right </summary>
    /// <summary> Повернуть выбранные плитки вправо </summary>
    procedure RotateRightSelectedTiles(
      const AList : TTileList);

    /// <summary> Remove selected tiles from the list </summary>
    /// <summary> Удалить выбранные плитки из списка </summary>
    procedure DeleteSelectedTiles(
      const AList : TTileList);
    /// <summary> Remove all tiles from the list </summary>
    /// <summary> Удалить все плитки из списка </summary>
    procedure DeleteAllTiles(
      const AList : TTileList);

    /// <summary> Load list of tiles from file </summary>
    /// <summary> Загрузить список плиток из файла </summary>
    function LoadTiles(
      const AFileName : String) : TTileList;
    /// <summary> Save the list of tiles to a file </summary>
    /// <summary> Сохранить список плиток в файл </summary>
    procedure SaveTiles(
      const AList     : TTileList;
      const AFileName : String);

    /// <summary> Move selected tiles to clipboard </summary>
    /// <summary> Перенести выбранные плитки в буфер обмена </summary>
    procedure CutTiles(
      const AList : TTileList);
    /// <summary> Copy selected tiles to clipboard </summary>
    /// <summary> Скопировать выбранные плитки в буфер обмена </summary>
    procedure CopyTiles(
      const AList : TTileList);
    /// <summary> Paste tiles from the clipboard </summary>
    /// <summary> Вставить плитки из буфера обмена </summary>
    procedure PasteTiles(
      const AList : TTileList);
    /// <summary> Get the state of the clipboard </summary>
    /// <summary> Получить состояние буфера обмена </summary>
    function  IsTilesClipboardEmpty() : Boolean;
  end;

implementation

uses
  {VCL}
  System.SysUtils;

{------------------------------------------------------------------------------}
{ TAppApi }
{------------------------------------------------------------------------------}

/// <summary> Class constructor </summary>
/// <summary> Конструктор класса </summary>
constructor TAppApi.Create(
  const AAppData : TAppData);
begin
  inherited Create();

  FAppData        := AAppData;
  FTileRepository := TTileFileRepository.Create();
end;

/// <summary> Class destructor </summary>
/// <summary> Деструктор класса </summary>
destructor TAppApi.Destroy();
begin
  FreeAndNil(FTileRepository);
  FAppData := nil;

  inherited Destroy();
end;

/// <summary> Create tile and add to list </summary>
/// <summary> Создать плитку и добавить в список </summary>
function TAppApi.CreateTile(
  const AKind     : TTileKind;
  const AColor    : TColor;
  const ARect     : TRect;
  const AAngle    : Integer = 0;
  const ASelected : Boolean = False) : TTile;
begin
  Result := TTile.Create(AKind, AColor, ARect, AAngle, ASelected);
  SetCoordsForTile(Result);
end;

/// <summary> Rotate selected tiles to the left </summary>
/// <summary> Повернуть выбранные плитки влево </summary>
procedure TAppApi.RotateLeftSelectedTiles(
  const AList : TTileList);
begin
  RotateSelectedTiles(AList, -CRotateAngle);
end;

/// <summary> Rotate selected tiles to the right </summary>
/// <summary> Повернуть выбранные плитки вправо </summary>
procedure TAppApi.RotateRightSelectedTiles(
  const AList : TTileList);
begin
  RotateSelectedTiles(AList, CRotateAngle);
end;

/// <summary> Rotate selected tiles by angle </summary>
/// <summary> Повернуть выбранные плитки на угол </summary>
procedure TAppApi.RotateSelectedTiles(
  const AList  : TTileList;
  const AAngle : Integer);
begin
  // iterate over all tiles
  // перебираем все плитки
  for var i := AList.Count - 1 downto 0 do
    // if tile is selected
    // если плитка выбрана
    if AList[i].Selected then
    begin
      // rotate it by a given angle
      // поворачиваем её на заданный угол
      AList[i].Angle := AList[i].Angle + AAngle;
      SetCoordsForTile(AList[i]);
    end;
end;

/// <summary> Set tile coordinates </summary>
/// <summary> Задать координаты для плитки </summary>
procedure TAppApi.SetCoordsForTile(
  const ATile : TTile);
begin
  case ATile.Kind of
    // Triangle
    tkTriangle:
      SetCoordsForTriangle(ATile);

    // Square
    tkSquare:
      SetCoordsForSquare(ATile);

    // Hexagon
    tkHexagon:
      SetCoordsForHexagon(ATile);

    // Octagon
    tkOctagon:
      SetCoordsForOctagon(ATile);
  end;
end;

/// <summary> Set coordinates for the Triangle tile </summary>
/// <summary> Задать координаты для плитки Треугольник </summary>
procedure TAppApi.SetCoordsForTriangle(
  const ATile : TTile);
var
  N    : Integer;
  A, D : Extended;
  W, H : Extended;
begin
  N := 3;
  D := 2 * Pi() / N;
  A := ATile.Angle * Pi() / 180;
  W := ATile.Rect.Width  / 2;
  H := ATile.Rect.Height / 2;
  for var i := 0 to N - 1 do
  begin
    ATile.Coords[i].X := Round(Round((W + (W - 1) * Cos(A - Pi() / 2 + D * i)) * 10) / 10);
    ATile.Coords[i].Y := Round(Round((H + (H - 1) * Sin(A - Pi() / 2 + D * i)) * 10) / 10);
  end;
end;

/// <summary> Set coordinates for the Square tile </summary>
/// <summary> Задать координаты для плитки Квадрат </summary>
procedure TAppApi.SetCoordsForSquare(
  const ATile : TTile);
var
  N    : Integer;
  A, D : Extended;
  W, H : Extended;
begin
  N := 4;
  D := 2 * Pi() / N;
  A := ATile.Angle * Pi() / 180;
  W := ATile.Rect.Width  / 2;
  H := ATile.Rect.Height / 2;
  for var i := 0 to N - 1 do
  begin
    ATile.Coords[i].X := Round(Round((W + (W - 1) * Cos(A - Pi() / 4 + D * i)) * 10) / 10);
    ATile.Coords[i].Y := Round(Round((H + (H - 1) * Sin(A - Pi() / 4 + D * i)) * 10) / 10);
  end;
end;

/// <summary> Set coordinates for Hexagon tile </summary>
/// <summary> Задать координаты для плитки Шестиугольник </summary>
procedure TAppApi.SetCoordsForHexagon(
  const ATile : TTile);
var
  N    : Integer;
  A, D : Extended;
  W, H : Extended;
begin
  N := 6;
  D := 2 * Pi() / N;
  A := ATile.Angle * Pi() / 180;
  W := ATile.Rect.Width  / 2;
  H := ATile.Rect.Height / 2;
  for var i := 0 to N - 1 do
  begin
    ATile.Coords[i].X := Round(Round((W + (W - 1) * Cos(A + D * i)) * 10) / 10);
    ATile.Coords[i].Y := Round(Round((H + (H - 1) * Sin(A + D * i)) * 10) / 10);
  end;
end;

/// <summary> Set coordinates for Octagon tile </summary>
/// <summary> Задать координаты для плитки Восьмиугольник </summary>
procedure TAppApi.SetCoordsForOctagon(
  const ATile : TTile);
var
  N    : Integer;
  A, D : Extended;
  W, H : Extended;
begin
  N := 8;
  D := 2 * Pi() / N;
  A := ATile.Angle * Pi() / 180;
  W := ATile.Rect.Width  / 2;
  H := ATile.Rect.Height / 2;
  for var i := 0 to N - 1 do
  begin
    ATile.Coords[i].X := Round(Round((W + (W - 1) * Cos(A - Pi() / N + D * i)) * 10) / 10);
    ATile.Coords[i].Y := Round(Round((H + (H - 1) * Sin(A - Pi() / N + D * i)) * 10) / 10);
  end;
end;

/// <summary> Remove selected tiles from the list </summary>
/// <summary> Удалить выбранные плитки из списка </summary>
procedure TAppApi.DeleteSelectedTiles(
  const AList : TTileList);
var
  i : Integer;
begin
  // iterate over all tiles
  // перебираем все плитки
  for i := AList.Count - 1 downto 0 do
    // if tile is selected
    // если плитка выбрана
    if AList[i].Selected then
      AList.Delete(i);
end;

/// <summary> Remove all tiles from the list </summary>
/// <summary> Удалить все плитки из списка </summary>
procedure TAppApi.DeleteAllTiles(
  const AList : TTileList);
begin
  AList.Clear();
end;

/// <summary> Load list of tiles from file </summary>
/// <summary> Загрузить список плиток из файла </summary>
function TAppApi.LoadTiles(
  const AFileName : String) : TTileList;
begin
  Result := FTileRepository.Load(AFileName);
  for var tile in Result do
    SetCoordsForTile(tile);
end;

/// <summary> Save the list of tiles to a file </summary>
/// <summary> Сохранить список плиток в файл </summary>
procedure TAppApi.SaveTiles(
  const AList     : TTileList;
  const AFileName : String);
begin
  FTileRepository.Save(AList, AFileName);
end;

/// <summary> Move selected tiles to clipboard </summary>
/// <summary> Перенести выбранные плитки в буфер обмена </summary>
procedure TAppApi.CutTiles(
  const AList : TTileList);
begin
  // clear the clipboard
  // очищаем буфер обмена
  FAppData.TilesСlipboard.Clear();

  var i := 0;
  // move the selected tiles to the clipboard
  // перемещаем выбранные плитки в буфер обмена
  while (i < AList.Count) do
    if (AList[i].Selected) then
      FAppData.TilesСlipboard.Add(
        AList.ExtractAt(i))
    else
      Inc(i);
end;

/// <summary> Copy selected tiles to clipboard </summary>
/// <summary> Скопировать выбранные плитки в буфер обмена </summary>
procedure TAppApi.CopyTiles(
  const AList : TTileList);
begin
  // clear the clipboard
  // очищаем буфер обмена
  FAppData.TilesСlipboard.Clear();

  // сщзн the selected tiles to the clipboard
  // копируем выбранные плитки в буфер обмена
  for var tile in AList do
    if (tile.Selected) then
      FAppData.TilesСlipboard.Add(
        CreateTile(tile.Kind, tile.Color, tile.Rect, tile.Angle));
end;

/// <summary> Paste tiles from the clipboard </summary>
/// <summary> Вставить плитки из буфера обмена </summary>
procedure TAppApi.PasteTiles(
  const AList : TTileList);
begin
  // remove selection from all tiles
  // убираем выделение со всех плиток
  for var tile in AList do
    tile.Selected := False;
  // paste tiles from the clipboard
  // вставляем плитки из буфера обмена
  for var tile in FAppData.TilesСlipboard do
    AList.Add(
      CreateTile(tile.Kind, tile.Color, tile.Rect, tile.Angle, True));
end;

/// <summary> Get the state of the clipboard </summary>
/// <summary> Получить состояние буфера обмена </summary>
function TAppApi.IsTilesClipboardEmpty() : Boolean;
begin
  Result := FAppData.TilesСlipboard.Count = 0;
end;

{------------------------------------------------------------------------------}

end.
