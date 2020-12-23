unit FmLayer;
{===============================================================================
  Unit        : FmLayer
  Description : Tile field form
  Описание    : Форма "Поле для плитки"
===============================================================================}

interface

uses
  {VCL}
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Generics.Collections,
  {DevExpress}
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  cxGroupBox,
  cxImageList,
  dxBar,
  dxBarExtItems,
  cxClasses,
  {App}
  AppTypes,
  Tiles,
  AppApi;

{------------------------------------------------------------------------------}

type
  /// <summary>
  /// <para> Tile image </para>
  /// <para> Изображение плитки </para>
  /// </summary>
  TTileImage = class(TObject)
  strict private
    /// <summary> Left border coordinate </summary>
    /// <summary> Координата левой границы </summary>
    FLeft: Integer;
    /// <summary> Top border coordinate </summary>
    /// <summary> Координата верхней границы </summary>
    FTop: Integer;
    /// <summary> Tiles </summary>
    /// <summary> Плитка </summary>
    FTile: TTile;
    /// <summary> Image </summary>
    /// <summary> Изображение </summary>
    FImage: TImage;
  strict protected
    /// <summary> Set the coordinate of the left border </summary>
    /// <summary> Задать координату левой границы </summary>
    procedure SetLeft(
      const Value : Integer);
    /// <summary> Set the coordinate of the top border </summary>
    /// <summary> Задать координату верхней границы </summary>
    procedure SetTop(
      const Value : Integer);
  public
    /// <summary> Class constructor </summary>
    /// <summary> Конструктор класса </summary>
    constructor Create(
      const ATile  : TTile;
      const AImage : TImage);
    /// <summary> Class destructor </summary>
    /// <summary> Деструктор класса </summary>
    destructor  Destroy(); override;

    /// <summary> Left border coordinate </summary>
    /// <summary> Координата левой границы </summary>
    property Left: Integer read FLeft write SetLeft;
    /// <summary> Top border coordinate </summary>
    /// <summary> Координата верхней границы </summary>
    property Top: Integer read FTop write SetTop;
    /// <summary> Tiles </summary>
    /// <summary> Плитка </summary>
    property Tile: TTile read FTile;
    /// <summary> Image </summary>
    /// <summary> Изображение </summary>
    property Image: TImage read FImage;
  end; { TTileImage }

type
  /// <summary>
  /// <para> List of tile images </para>
  /// <para> Список изображений плиток </para>
  /// </summary>
  TTileImageList = class(TObjectList<TTileImage>)
  public
    /// <summary> Presence of selected tiles </summary>
    /// <summary> Наличие выбранных плиток </summary>
    function  HasSelected() : Boolean;
  end; { TTileImageList }

{------------------------------------------------------------------------------}

type
  /// <summary>
  /// <para> Tile field form </para>
  /// <para> Форма "Поле для плитки" </para>
  /// </summary>
  TFm_Layer = class(TForm)
    {$REGION ' Components '}
    dxBrMr_Menu: TdxBarManager;
    dxBar_Main: TdxBar;
    AL_1: TActionList;
    Act_AddTriangle: TAction;
    Act_Delete: TAction;
    Act_Close: TAction;
    cxIL_1: TcxImageList;
    Act_Save: TAction;
    Act_Clear: TAction;
    dxBarBtn_Add: TdxBarSubItem;
    dxBarBtn_AddTriangle: TdxBarButton;
    dxBarBtn_AddSquare: TdxBarButton;
    dxBarBtn_AddHexagon: TdxBarButton;
    dxBarBtn_AddOctagon: TdxBarButton;
    Act_AddSquare: TAction;
    Act_AddHexagon: TAction;
    Act_AddOctagon: TAction;
    dxBarBtn_Delete: TdxBarButton;
    Act_Add: TAction;
    dxBarBtn_Clear: TdxBarButton;
    dxBarBtn_Close: TdxBarButton;
    dxBarBtn_Save: TdxBarButton;
    Act_Open: TAction;
    dxBarBtn_Open: TdxBarButton;
    Act_SelectAll: TAction;
    Act_DeselectAll: TAction;
    dxBarBtn_SelectAll: TdxBarButton;
    dxBarBtn_DeselectAll: TdxBarButton;
    dxBarBtn_Color: TdxBarColorCombo;
    Act_SetColor: TAction;
    dxBarBtn_SetColor: TdxBarButton;
    Act_Cut: TAction;
    Act_Copy: TAction;
    Act_Paste: TAction;
    dxBarBtn_Cut: TdxBarButton;
    dxBarBtn_Copy: TdxBarButton;
    dxBarBtn_Paste: TdxBarButton;
    SBox_Layer: TScrollBox;
    dxBarBtn_Size: TdxBarCombo;
    Act_RotateLeft: TAction;
    Act_RotateRight: TAction;
    dxBarBtn_RotateLeft: TdxBarButton;
    dxBarBtn_RotateRight: TdxBarButton;
    Act_SaveAs: TAction;
    dxBarBtn_SaveAs: TdxBarButton;
    cxGBox_Layer: TcxGroupBox;
    Img_Blank: TImage;
    dxBarBtn_1: TdxBarButton;
    {$ENDREGION}
    {$REGION ' Form events '}
    /// <summary> Create a window </summary>
    /// <summary> Создание окна </summary>
    procedure FormCreate(Sender: TObject);
    /// <summary> Destroying a window </summary>
    /// <summary> Уничтожение окна </summary>
    procedure FormDestroy(Sender: TObject);
    /// <summary> Show window </summary>
    /// <summary> Отображение окна </summary>
    procedure FormShow(Sender: TObject);
    {$ENDREGION}
    {$REGION ' Component events '}
    /// <summary> Click on the image </summary>
    /// <summary> Нажать кнопку мышки на изображении </summary>
    procedure OnImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    /// <summary> Move the mouse cursor over the image </summary>
    /// <summary> Перемещение курсора мышки на изображении </summary>
    procedure OnImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    /// <summary> Release the mouse button on the image </summary>
    /// <summary> Отпустить кнопку мышки на изображении </summary>
    procedure OnImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    /// <summary> Clicking on the field </summary>
    /// <summary> Нажатие кнопкой мышки на поле </summary>
    procedure cxGBox_LayerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    /// <summary> Move the mouse cursor to the field </summary>
    /// <summary> Перемещение курсора мышки на поле </summary>
    procedure cxGBox_LayerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    /// <summary> Releasing the mouse button on the field </summary>
    /// <summary> Отпускание кнопки мышки на поле </summary>
    procedure cxGBox_LayerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    {$ENDREGION}
    {$REGION ' Actions '}
    /// <summary> Load from file </summary>
    /// <summary> Загрузить из файла </summary>
    procedure Act_OpenExecute(Sender: TObject);
    /// <summary> Save to file </summary>
    /// <summary> Сохранить в файл </summary>
    procedure Act_SaveExecute(Sender: TObject);
    /// <summary> Save As </summary>
    /// <summary> Сохранить как </summary>
    procedure Act_SaveAsExecute(Sender: TObject);

    /// <summary> Add tile </summary>
    /// <summary> Добавить плитку </summary>
    procedure Act_AddExecute(Sender: TObject);
    /// <summary> Add Triangle tile </summary>
    /// <summary> Добавить плитку Треугольник </summary>
    procedure Act_AddTriangleExecute(Sender: TObject);
    /// <summary> Add Square tile </summary>
    /// <summary> Добавить плитку Квадрат </summary>
    procedure Act_AddSquareExecute(Sender: TObject);
    /// <summary> Add Hexagon tile </summary>
    /// <summary> Добавить плитку Шестиугольник </summary>
    procedure Act_AddHexagonExecute(Sender: TObject);
    /// <summary> Add Octagon tile </summary>
    /// <summary> Добавить плитку Восьмиугольник </summary>
    procedure Act_AddOctagonExecute(Sender: TObject);

    /// <summary> Cut </summary>
    /// <summary> Вырезать </summary>
    procedure Act_CutExecute(Sender: TObject);
    /// <summary> Copy </summary>
    /// <summary> Копировать </summary>
    procedure Act_CopyExecute(Sender: TObject);
    /// <summary> Paste </summary>
    /// <summary> Вставить </summary>
    procedure Act_PasteExecute(Sender: TObject);
    /// <summary> Remove selected tiles </summary>
    /// <summary> Удалить выбранные плитки </summary>
    procedure Act_DeleteExecute(Sender: TObject);
    /// <summary> Remove all tiles </summary>
    /// <summary> Удалить все плитки </summary>
    procedure Act_ClearExecute(Sender: TObject);

    /// <summary> Select all tiles </summary>
    /// <summary> Выбрать все плитки </summary>
    procedure Act_SelectAllExecute(Sender: TObject);
    /// <summary> Unselect all tiles </summary>
    /// <summary> Убрать выделение со всех плиток </summary>
    procedure Act_DeselectAllExecute(Sender: TObject);
    /// <summary> Rotate left </summary>
    /// <summary> Повернуть влево </summary>
    procedure Act_RotateLeftExecute(Sender: TObject);
    /// <summary> Rotate right </summary>
    /// <summary> Повернуть вправо </summary>
    procedure Act_RotateRightExecute(Sender: TObject);
    /// <summary> Set tile color </summary>
    /// <summary> Задать цвет плитки </summary>
    procedure Act_SetColorExecute(Sender: TObject);

    /// <summary> Close window </summary>
    /// <summary> Закрыть окно </summary>
    procedure Act_CloseExecute(Sender: TObject);
    {$ENDREGION}
  strict private
    /// <summary> The software part of the application </summary>
    /// <summary> Программная часть приложения </summary>
    FAppApi       : TAppApi;
    /// <summary> List of tiles </summary>
    /// <summary> Список плиток </summary>
    FTiles        : TTileList;
    /// <summary> List of tile images </summary>
    /// <summary> Список изображений плиток </summary>
    FImages       : TTileImageList;
    /// <summary> File name to save </summary>
    /// <summary> Имя файла для сохранения </summary>
    FFileName     : String;

    /// <summary> The starting point of the tile movement </summary>
    /// <summary> Начальная точка перемещения плитки </summary>
    FTilePoint    : TPoint;
    /// <summary> Tile selection attribute </summary>
    /// <summary> Признак выбора плитки </summary>
    FTileSelect   : Boolean;
    /// <summary> Tile movement indicator </summary>
    /// <summary> Признак перемещения плитки </summary>
    FTileDrag     : Boolean;

    /// <summary> Starting point for selecting a group of tiles </summary>
    /// <summary> Начальная точка выбора группы плиток </summary>
    FSelectBegin  : TPoint;
    /// <summary> Endpoint of tile group selection </summary>
    /// <summary> Конечная точка выбора группы плиток </summary>
    FSelectEnd    : TPoint;
    /// <summary> Flag for selecting a group of tiles </summary>
    /// <summary> Признак выбора группы плиток </summary>
    FSelectGroup  : Boolean;
    /// <summary> Offset the insertion point from the clipboard </summary>
    /// <summary> Смещение точки вставки из буфера обмена </summary>
    FOffset       : TPoint;

    /// <summary> Create tile image </summary>
    /// <summary> Создать изображение плитки </summary>
    procedure CreateTile(
      const AKind : TTileKind);
    /// <summary> Create tile image </summary>
    /// <summary> Создать изображение плитки </summary>
    function CreateTileImage(
      const ATile : TTile) : TTileImage;
    /// <summary> Draw tile images </summary>
    /// <summary> Нарисовать изображения плиток </summary>
    procedure DrawTileImages();
    /// <summary> Draw tile selection </summary>
    /// <summary> Нарисовать выделение плитки </summary>
    procedure DrawTileSelection(
      const AImage : TTileImage);

    /// <summary> Action availability </summary>
    /// <summary> Доступность действий </summary>
    procedure AdjustActions();
  strict protected
    {}
  public
    /// <summary> Class constructor </summary>
    /// <summary> Конструктор класса </summary>
    constructor Create(
      const AOwner    : TComponent;
      const AAppApi   : TAppApi;
      const ATiles    : TTileList;
      const AFileName : String = ''); reintroduce;
    /// <summary> Class destructor </summary>
    /// <summary> Деструктор класса </summary>
    destructor  Destroy(); override;
  end; { TFm_Layer }

implementation

uses
  {VCL}
  System.Math;

{$R *.dfm}

{------------------------------------------------------------------------------}
{ TTileImage }
{------------------------------------------------------------------------------}

/// <summary> Class constructor </summary>
/// <summary> Конструктор класса </summary>
constructor TTileImage.Create(
  const ATile  : TTile;
  const AImage : TImage);
begin
  inherited Create();

  FLeft  := AImage.Left;
  FTop   := AImage.Top;
  FTile  := ATile;
  FImage := AImage;
end;

/// <summary> Class destructor </summary>
/// <summary> Деструктор класса </summary>
destructor TTileImage.Destroy();
begin
  FreeAndNil(FImage);
  FTile := nil;

  inherited Destroy();
end;

/// <summary> Set the coordinate of the left border </summary>
/// <summary> Задать координату левой границы </summary>
procedure TTileImage.SetLeft(
  const Value : Integer);
begin
  if (FLeft <> Value) then begin
    FLeft := Value;
    if Assigned(FImage) then
      FImage.Left := Value;
    if Assigned(FTile) then
      FTile.Rect.SetLocation(Value, FTile.Rect.Top);
  end;
end;

/// <summary> Set the coordinate of the top border </summary>
/// <summary> Задать координату верхней границы </summary>
procedure TTileImage.SetTop(
  const Value : Integer);
begin
  if (FTop <> Value) then begin
    FTop := Value;
    if Assigned(FImage) then
      FImage.Top := Value;
    if Assigned(FTile) then
      FTile.Rect.SetLocation(FTile.Rect.Left, Value);
  end;
end;

{------------------------------------------------------------------------------}
{ TTileImageList }
{------------------------------------------------------------------------------}

/// <summary> Presence of selected tiles </summary>
/// <summary> Наличие выбранных плиток </summary>
function TTileImageList.HasSelected() : Boolean;
begin
  Result := False;

  for var image in Self do
    if image.Tile.Selected then
    begin
      Result := True;
      Break;
    end;
end;

{------------------------------------------------------------------------------}
{ TFm_Layer }
{------------------------------------------------------------------------------}

/// <summary> Class constructor </summary>
/// <summary> Конструктор класса </summary>
constructor TFm_Layer.Create(
  const AOwner    : TComponent;
  const AAppApi   : TAppApi;
  const ATiles    : TTileList;
  const AFileName : String = '');
begin
  inherited Create(AOwner);

  FAppApi   := AAppApi;
  FTiles    := ATiles;
  FFileName := AFileName;

  // if a file name is given, display it in the window title
  // если задано имя файла, выводим его в заголовок окна
  if (FFileName.Length > 0) then
    Caption := FFileName;
end;

/// <summary> Class destructor </summary>
/// <summary> Деструктор класса </summary>
destructor TFm_Layer.Destroy();
begin
  FreeAndNil(FTiles);
  FAppApi := nil;

  inherited Destroy();
end;

{$REGION ' Form events '}
/// <summary> Create a window </summary>
/// <summary> Создание окна </summary>
procedure TFm_Layer.FormCreate(Sender: TObject);
begin
  inherited;

  FImages := TTileImageList.Create();
end;

/// <summary> Destroying a window </summary>
/// <summary> Уничтожение окна </summary>
procedure TFm_Layer.FormDestroy(Sender: TObject);
begin
  FAppApi := nil;
  FreeAndNil(FImages);

  inherited;
end;

/// <summary> Show window </summary>
/// <summary> Отображение окна </summary>
procedure TFm_Layer.FormShow(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  // fill in the list of tile sizes
  // заполняем список размеров плиток
  dxBarBtn_Size.Items.Clear();
  dxBarBtn_Size.Items.BeginUpdate();
  i := 50;
  while (i <= 200) do
  begin
    dxBarBtn_Size.Items.Add(i.ToString());
    Inc(i, 5)
  end;
  dxBarBtn_Size.Items.EndUpdate();
  dxBarBtn_Size.Text := '100';

  // create tile images
  // создаём изображения плиток
  for var tile in FTiles do
    FImages.Add(CreateTileImage(tile));

  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();

  AdjustActions();
end;
{$ENDREGION}

{$REGION ' Component events '}
/// <summary> Click on the image </summary>
/// <summary> Нажать кнопку мышки на изображении </summary>
procedure TFm_Layer.OnImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Img : TImage;
begin
  if (Sender is TImage) and
     (Button = mbLeft)  then
  begin
    Img := TImage(Sender);

    FTilePoint.X := X;
    FTilePoint.Y := Y;

    // look for the selected tile image
    // ищем выбранное изображение плитки
    for var image in FImages do
      if (image.Image = Img) then
      begin
        // if a tile is selected, then the tile starts moving
        // если плитка выбрана, то начинается перемещение плитки
        FTileSelect := image.Tile.Selected;
        Break;
      end;
  end;

  AdjustActions();
end;

/// <summary> Move the mouse cursor over the image </summary>
/// <summary> Перемещение курсора мышки на изображении </summary>
procedure TFm_Layer.OnImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Sender is TImage) and
     (ssLeft in Shift)  then
  begin
    // if moving the tile
    // если перемещение плитки
    if FTileSelect then
    begin
      FTileDrag := True;
      // move all selected tiles
      // перемещаем все выбранные плитки
      for var image in FImages do
        if (image.Tile.Selected) then
        begin
          image.Left := image.Left + X - FTilePoint.X;
          image.Top  := image.Top  + Y - FTilePoint.Y;
        end;
    end;
  end;

  AdjustActions();
end;

/// <summary> Release the mouse button on the image </summary>
/// <summary> Отпустить кнопку мышки на изображении </summary>
procedure TFm_Layer.OnImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  // minimum distance between vertices for tile docking
  // минимальное расстояние между вершинами для пристыковки плиток
  CDistMin = 20;
var
  i, ci  : Integer;
  j, cj  : Integer;
  Pi, Pj : TPoint;
  D      : Double;
  dX, dY : Integer;
  Img    : TImage;
  Found  : Boolean;
begin
  if (Sender is TImage) and
     (Button = mbLeft)  then
  begin
    Img := TImage(Sender);

    // if there was a tile movement
    // если было перемещение плитки
    if FTileDrag then
    begin
      dX    := 0;
      dY    := 0;
      Found := False;

      // for each moved tile, look for the closest neighbor to dock
      // для каждой перемещённой плитки ищем ближайшего соседа для пристыковки
      for i := 0 to FImages.Count - 1 do
        if FImages[i].Tile.Selected then
        begin
          // look for adjacent tiles
          // ищем соседние плитки
          for j := 0 to FImages.Count - 1 do
          begin
            if (j <> i) and (not FImages[j].Tile.Selected) then
            begin
              for ci := Low(FImages[i].Tile.Coords) to High(FImages[i].Tile.Coords) do
              begin
                for cj := Low(FImages[j].Tile.Coords) to High(FImages[j].Tile.Coords) do
                begin
                  // determine the distance between the vertices of adjacent tiles
                  // определяем расстояние между вершинами соседних плиток
                  Pi.X := FImages[i].Tile.Rect.Left + FImages[i].Tile.Coords[ci].X;
                  Pi.Y := FImages[i].Tile.Rect.Top  + FImages[i].Tile.Coords[ci].Y;
                  Pj.X := FImages[j].Tile.Rect.Left + FImages[j].Tile.Coords[cj].X;
                  Pj.Y := FImages[j].Tile.Rect.Top  + FImages[j].Tile.Coords[cj].Y;
                  D    := Pi.Distance(Pj);
                  // if the minimum distance for docking tiles is reached
                  // если достигнуто минимальное расстояние для пристыковки плиток
                  if (D <= CDistMin) then
                  begin
                    // remember the distance to move the moved tiles
                    // запоминаем расстояние, на которое нужно сместить перемещённые плитки
                    dX    := Pj.X - Pi.X;
                    dY    := Pj.Y - Pi.Y;
                    Found := True;
                  end;
                  if Found then
                    Break;
                end;
                if Found then
                  Break;
              end;
            end;
            if Found then
              Break;
          end;
          if Found then
            Break;
        end;

      // if the nearest tile is found, for each moved tile we dock
      // если нашли ближайшую плитку, для каждой перемещённой плитки производим пристыковку
      if Found then
        for var image in FImages do
          if (image.Tile.Selected) then
          begin
            image.Left := image.Left + dX;
            image.Top  := image.Top  + dY;
          end;
    end
    else
    // if there was no movement, handle a simple mouse click on the tile
    // если не было перемещения, обрабатываем простой щелчок мышкой на плитке
    if (not FTileDrag) and (X = FTilePoint.X) and (Y = FTilePoint.Y) then
    begin
      // look for the selected tile image
      // ищем выбранное изображение плитки
      for var image in FImages do
        if (image.Image = Img) then
        begin
          // set or unset the selection flag
          // ставим или снимаем признак выбора
          image.Tile.Selected := not image.Tile.Selected;
          // draw the selection box
          // рисуем рамку выбора
          DrawTileSelection(image);

          Break;
        end;
    end;

    FTileSelect := False;
    FTileDrag   := False;
  end;

  AdjustActions();
end;

/// <summary> Clicking on the field </summary>
/// <summary> Нажатие кнопкой мышки на поле </summary>
procedure TFm_Layer.cxGBox_LayerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender = cxGBox_Layer) and
     (Button = mbLeft)       then
  begin
    // erase the old selection box
    // стираем старую рамку выбора
    cxGBox_Layer.Canvas.Pen.Color := clLime;
    cxGBox_Layer.Canvas.Pen.Mode  := pmXor;
    if (FSelectEnd.X < MaxInt) and (FSelectEnd.Y < MaxInt) then
      cxGBox_Layer.Canvas.Polyline([
        FSelectBegin,
        TPoint.Create(FSelectEnd  .X, FSelectBegin.Y),
        TPoint.Create(FSelectEnd  .X, FSelectEnd  .Y),
        TPoint.Create(FSelectBegin.X, FSelectEnd  .Y),
        FSelectBegin]);
    cxGBox_Layer.Canvas.Pen.Mode := pmCopy;

    // remember the starting point of the selection
    // запоминаем начальную точку выбора
    FSelectBegin.X := X;
    FSelectBegin.Y := Y;
    FSelectEnd  .X := MaxInt;
    FSelectEnd  .Y := MaxInt;

    FSelectGroup := True;
  end;

  AdjustActions();
end;

/// <summary> Move the mouse cursor to the field </summary>
/// <summary> Перемещение курсора мышки на поле </summary>
procedure TFm_Layer.cxGBox_LayerMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Sender = cxGBox_Layer) then
  begin
    if FSelectGroup then
    begin
      cxGBox_Layer.Canvas.Pen.Color := clLime;
      cxGBox_Layer.Canvas.Pen.Mode  := pmXor;

      // erase the old selection box
      // стираем старую рамку выбора
      if (FSelectEnd.X < MaxInt) and (FSelectEnd.Y < MaxInt) then
        cxGBox_Layer.Canvas.Polyline([
          FSelectBegin,
          TPoint.Create(FSelectEnd  .X, FSelectBegin.Y),
          TPoint.Create(FSelectEnd  .X, FSelectEnd  .Y),
          TPoint.Create(FSelectBegin.X, FSelectEnd  .Y),
          FSelectBegin]);

      // draw a new selection box
      // рисуем новую рамку выбора
      FSelectEnd.X := X;
      FSelectEnd.Y := Y;
      cxGBox_Layer.Canvas.Polyline([
        FSelectBegin,
        TPoint.Create(FSelectEnd  .X, FSelectBegin.Y),
        TPoint.Create(FSelectEnd  .X, FSelectEnd  .Y),
        TPoint.Create(FSelectBegin.X, FSelectEnd  .Y),
        FSelectBegin]);

      cxGBox_Layer.Canvas.Pen.Mode := pmCopy;
    end;
  end;

  AdjustActions();
end;

/// <summary> Releasing the mouse button on the field </summary>
/// <summary> Отпускание кнопки мышки на поле </summary>
procedure TFm_Layer.cxGBox_LayerMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  R      : TRect;
  P      : TPoint;
  Select : Boolean;
begin
  if (Sender = cxGBox_Layer) and
     (Button = mbLeft)       then
  begin
    if FSelectGroup then
    begin
      // erase the selection box
      // стираем рамку выбора
      cxGBox_Layer.Canvas.Pen.Color := clLime;
      cxGBox_Layer.Canvas.Pen.Mode  := pmXor;
      FSelectEnd.X := X;
      FSelectEnd.Y := Y;
      if (FSelectEnd.X < MaxInt) and (FSelectEnd.Y < MaxInt) then
        cxGBox_Layer.Canvas.Polyline([
          FSelectBegin,
          TPoint.Create(FSelectEnd  .X, FSelectBegin.Y),
          TPoint.Create(FSelectEnd  .X, FSelectEnd  .Y),
          TPoint.Create(FSelectBegin.X, FSelectEnd  .Y),
          FSelectBegin]);
      FSelectEnd.X := MaxInt;
      FSelectEnd.Y := MaxInt;
      cxGBox_Layer.Canvas.Pen.Mode := pmCopy;

      // remove selection from all tiles
      // убираем выбор со всех плиток
      Act_DeselectAll.Execute();

      // define the coordinates of the selection box
      // определяем координаты рамки выбора
      R.Left   := Min(FSelectBegin.X, X);
      R.Right  := Max(FSelectBegin.X, X);
      R.Top    := Min(FSelectBegin.Y, Y);
      R.Bottom := Max(FSelectBegin.Y, Y);

      // select tiles that are in the selection box
      // выбираем плитки, которые попали в рамку выбора
      for var image in FImages do
      begin
        Select := True;
        for var coords in image.Tile.Coords do
        begin
          P.X := image.Tile.Rect.Left + coords.X;
          P.Y := image.Tile.Rect.Top  + coords.Y;
          Select := Select and R.Contains(P);
        end;
        if Select then
        begin
          // set the selection flag
          // ставим признак выбора
          image.Tile.Selected := True;
          // draw the selection box
          // рисуем рамку выбора
          DrawTileSelection(image);
        end;
      end;

      FSelectGroup := False;
    end;
  end;

  AdjustActions();
end;
{$ENDREGION}

{$REGION ' Actions '}
/// <summary> Load from file </summary>
/// <summary> Загрузить из файла </summary>
procedure TFm_Layer.Act_OpenExecute(Sender: TObject);
var
  OD   : TOpenDialog;
  Load : Boolean;
begin
  OD := TOpenDialog.Create(nil);
  try
    // display the file open dialog
    // выводим диалог открытия файла
    OD.DefaultExt := 'dat';
    OD.Filter     := 'Файлы данных (*.dat)|*.dat|' + 'Все файлы|*.*|';
    OD.Options    := OD.Options +
      [ofPathMustExist, ofFileMustExist, ofEnableSizing];

    // if a file is selected, remember the file name
    // если файл выбран, запоминаем имя файла
    Load := OD.Execute();
    if Load then
      FFileName := OD.FileName;
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
      // remove all tile images
      // удаляем все изображения плиток
      FImages.Clear();
      // remove all tiles from the list
      // удаляем все плитки из списка
      FreeAndNil(FTiles);
      // load data
      // загружаем данные
      FTiles := FAppApi.LoadTiles(FFileName);
      // create tile images
      // создаём изображения плиток
      for var tile in FTiles do
        FImages.Add(CreateTileImage(tile));

      // draw tile images
      // рисуем изображения плиток
      DrawTileImages();

      // set the file name in the window title
      // выводим в заголовок окна имя файла
      Self.Caption := FFileName;
    finally
      Screen.Cursor := crDefault;
      Self.Enabled  := True;
    end;
  end;

  AdjustActions();
end;

/// <summary> Save to file </summary>
/// <summary> Сохранить в файл </summary>
procedure TFm_Layer.Act_SaveExecute(Sender: TObject);
begin
  // if the file name is not specified, display the file save dialog
  // если имя файла не задано, выводим диалог сохранения файла
  if (FFileName.Length <= 0) then
  begin
    Act_SaveAs.Execute();
  end
  else
  // save the data
  // сохраняем данные
  begin
    Self.Enabled  := False;
    Screen.Cursor := crHourGlass;
    try
      FAppApi.SaveTiles(FTiles, FFileName);
    finally
      Screen.Cursor := crDefault;
      Self.Enabled  := True;
    end;
  end;

  AdjustActions();
end;

/// <summary> Save As </summary>
/// <summary> Сохранить как </summary>
procedure TFm_Layer.Act_SaveAsExecute(Sender: TObject);
var
  SD   : TSaveDialog;
  Save : Boolean;
begin
  SD := TSaveDialog.Create(nil);
  try
    // display the file save dialog
    // выводим диалог сохранения файла
    SD.DefaultExt := 'dat';
    SD.Filter     := 'Файлы данных (*.dat)|*.dat|' + 'Все файлы|*.*|';
    SD.Options    := SD.Options +
      [ofOverwritePrompt, ofPathMustExist, ofNoReadOnlyReturn, ofEnableSizing];

    // if file is selected
    // если файл выбран
    Save := SD.Execute();
    if Save then
      FFileName := SD.FileName;
  finally
    FreeAndNil(SD);
  end;

  // save the data
  // сохраняем данные
  if Save then
  begin
    Self.Enabled  := False;
    Screen.Cursor := crHourGlass;
    try
      FAppApi.SaveTiles(FTiles, FFileName);

      // set the file name in the window title
      // выводим в заголовок окна имя файла
      Self.Caption := FFileName;
    finally
      Screen.Cursor := crDefault;
      Self.Enabled  := True;
    end;
  end;

  AdjustActions();
end;

/// <summary> Add tile </summary>
/// <summary> Добавить плитку </summary>
procedure TFm_Layer.Act_AddExecute(Sender: TObject);
begin
  AdjustActions();
end;

/// <summary> Add Triangle tile </summary>
/// <summary> Добавить плитку Треугольник </summary>
procedure TFm_Layer.Act_AddTriangleExecute(Sender: TObject);
begin
  CreateTile(tkTriangle);

  AdjustActions();
end;

/// <summary> Add Square tile </summary>
/// <summary> Добавить плитку Квадрат </summary>
procedure TFm_Layer.Act_AddSquareExecute(Sender: TObject);
begin
  CreateTile(tkSquare);

  AdjustActions();
end;

/// <summary> Add Hexagon tile </summary>
/// <summary> Добавить плитку Шестиугольник </summary>
procedure TFm_Layer.Act_AddHexagonExecute(Sender: TObject);
begin
  CreateTile(tkHexagon);

  AdjustActions();
end;

/// <summary> Add Octagon tile </summary>
/// <summary> Добавить плитку Восьмиугольник </summary>
procedure TFm_Layer.Act_AddOctagonExecute(Sender: TObject);
begin
  CreateTile(tkOctagon);

  AdjustActions();
end;

/// <summary> Cut </summary>
/// <summary> Вырезать </summary>
procedure TFm_Layer.Act_CutExecute(Sender: TObject);
var
  i : Integer;
begin
  // delete the selected tile images
  // удаляем выбранные изображения плиток
  for i := FImages.Count - 1 downto 0 do
    if FImages[i].Tile.Selected then
      FImages.Delete(i);
  // move the selected tiles to the clipboard
  // переносим выбранные плитки в буфер обмена
  FAppApi.CutTiles(FTiles);

  AdjustActions();
end;

/// <summary> Copy </summary>
/// <summary> Копировать </summary>
procedure TFm_Layer.Act_CopyExecute(Sender: TObject);
begin
  // copy the selected tiles to the clipboard
  FAppApi.CopyTiles(FTiles);

  AdjustActions();
end;

/// <summary> Paste </summary>
/// <summary> Вставить </summary>
procedure TFm_Layer.Act_PasteExecute(Sender: TObject);
const
  // how much to shift the inserted images by X
  // на сколько сместить вставленные изображения по X
  CDX = 10;
  // how much to shift the inserted images by Y
  // на сколько сместить вставленные изображения по Y
  CDY = 10;
begin
  // paste tiles from the clipboard
  // вставляем плитки из буфера обмена
  FAppApi.PasteTiles(FTiles);
  // create tile images
  // создаём изображения плиток
  for var tile in FTiles do
    if (tile.Selected) then
      FImages.Add(CreateTileImage(tile));

  // offset the inserted images
  // смещаем вставленные изображения
  FOffset.Offset(CDX, CDY);
  if (FOffset.Y > 100) then
    FOffset.Offset(-90, -100);
  for var image in FImages do
    if (image.Tile.Selected) then
    begin
      image.Left := image.Left + FOffset.X;
      image.Top  := image.Top  + FOffset.Y;
    end;

  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();

  AdjustActions();
end;

/// <summary> Remove selected tiles </summary>
/// <summary> Удалить выбранные плитки </summary>
procedure TFm_Layer.Act_DeleteExecute(Sender: TObject);
var
  i : Integer;
begin
  // delete the selected tile images
  // удаляем выбранные изображения плиток
  for i := FImages.Count - 1 downto 0 do
    if (FImages[i].Tile.Selected) then
      FImages.Delete(i);

  // remove selected tiles from the list
  // удаляем выбранные плитки из списка
  FAppApi.DeleteSelectedTiles(FTiles);

  AdjustActions();
end;

/// <summary> Remove all tiles </summary>
/// <summary> Удалить все плитки </summary>
procedure TFm_Layer.Act_ClearExecute(Sender: TObject);
begin
  // delete all tile images
  // удаляем все изображения плиток
  FImages.Clear();
  // remove all tiles from the list
  // удаляем все плитки из списка
  FAppApi.DeleteAllTiles(FTiles);

  AdjustActions();
end;

/// <summary> Select all tiles </summary>
/// <summary> Выбрать все плитки </summary>
procedure TFm_Layer.Act_SelectAllExecute(Sender: TObject);
begin
  for var image in FImages do
    if (not image.Tile.Selected) then
    begin
      // set the selection flag
      // ставим признак выбора
      image.Tile.Selected := True;
      // draw the selection box
      // рисуем рамку выбора
      DrawTileSelection(image);
    end;

  AdjustActions();
end;

/// <summary> Unselect all tiles </summary>
/// <summary> Убрать выделение со всех плиток </summary>
procedure TFm_Layer.Act_DeselectAllExecute(Sender: TObject);
begin
  for var image in FImages do
    if (image.Tile.Selected) then
    begin
      // remove the selection flag
      // снимаем признак выбора
      image.Tile.Selected := False;
      // remove the selection box
      // снимаем рамку выбора
      DrawTileSelection(image);
    end;

  AdjustActions();
end;

/// <summary> Rotate left </summary>
/// <summary> Повернуть влево </summary>
procedure TFm_Layer.Act_RotateLeftExecute(Sender: TObject);
begin
  // rotate selected tiles to the left
  // поворачиваем выбранные плитки влево
  FAppApi.RotateLeftSelectedTiles(FTiles);
  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();

  AdjustActions();
end;

/// <summary> Rotate right </summary>
/// <summary> Повернуть вправо </summary>
procedure TFm_Layer.Act_RotateRightExecute(Sender: TObject);
begin
  // rotate selected tiles to the left
  // поворачиваем выбранные плитки влево
  FAppApi.RotateRightSelectedTiles(FTiles);
  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();

  AdjustActions();
end;

/// <summary> Set tile color </summary>
/// <summary> Задать цвет плитки </summary>
procedure TFm_Layer.Act_SetColorExecute(Sender: TObject);
begin
  for var image in FImages do
    if (image.Tile.Selected) then
      image.Tile.Color := dxBarBtn_Color.Color;

  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();

  AdjustActions();
end;

/// <summary> Close window </summary>
/// <summary> Закрыть окно </summary>
procedure TFm_Layer.Act_CloseExecute(Sender: TObject);
begin
  Free();
end;
{$ENDREGION}

/// <summary> Create tile image </summary>
/// <summary> Создать изображение плитки </summary>
procedure TFm_Layer.CreateTile(
  const AKind : TTileKind);
var
  Rect : TRect;
  Tile : TTile;
  Size : Integer;
begin
  // set the size and position of the tile
  // задаём размеры и положение плитки
  Size        := StrToIntDef(dxBarBtn_Size.Text, 100);
  Rect.Left   := 10;
  Rect.Top    := 10;
  Rect.Width  := Size;
  Rect.Height := Size;

  // create a tile object
  // создаём объект плитки
  Tile := FAppApi.CreateTile(AKind, dxBarBtn_Color.Color, Rect);
  FTiles.Add(Tile);
  // create a tile image
  // создаём изображение плитки
  FImages.Add(CreateTileImage(Tile));

  // remove selection from all tiles
  // убираем выбор со всех плиток
  Act_DeselectAll.Execute();
  // select a new tile
  // выбираем новую плитку
  Tile.Selected := True;
  // draw tile images
  // рисуем изображения плиток
  DrawTileImages();
end;

/// <summary> Create tile image </summary>
/// <summary> Создать изображение плитки </summary>
function TFm_Layer.CreateTileImage(
  const ATile : TTile) : TTileImage;
var
  Img : TImage;
begin
  // create a tile image
  // создаём изображение плитки
  Img        := TImage.Create(cxGBox_Layer);
  Img.Left   := ATile.Rect.Left;
  Img.Top    := ATile.Rect.Top;
  Img.Width  := ATile.Rect.Width;
  Img.Height := ATile.Rect.Height;
  Img.Transparent := True;
  // assign events for actions with the mouse
  // назначаем события для действий мышкой
  Img.OnMouseDown := OnImageMouseDown;
  Img.OnMouseMove := OnImageMouseMove;
  Img.OnMouseUp   := OnImageMouseUp;
  // add an image to the field
  // добавляем изображение на поле
  cxGBox_Layer.InsertControl(Img);

  Result := TTileImage.Create(ATile, Img);
end;

/// <summary> Draw tile images </summary>
/// <summary> Нарисовать изображения плиток </summary>
procedure TFm_Layer.DrawTileImages();
begin
  for var image in FImages do
  begin
    image.Image.Picture.Bitmap.Assign(Img_Blank.Picture.Bitmap);
    image.Image.Picture.Bitmap.Canvas.Pen.Color   := clBlack;
    image.Image.Picture.Bitmap.Canvas.Brush.Color := image.Tile.Color;
    image.Image.Picture.Bitmap.Canvas.Polygon(image.Tile.Coords);

    if image.Tile.Selected then
      // draw the selection box
      // рисуем рамку выбора
      DrawTileSelection(image);
  end;
end;

/// <summary> Draw tile selection </summary>
/// <summary> Нарисовать выделение плитки </summary>
procedure TFm_Layer.DrawTileSelection(
  const AImage : TTileImage);
var
  Img : TImage;
begin
  // draw the selection box
  // рисуем рамку выбора
  Img := AImage.Image;
  Img.Picture.Bitmap.Canvas.Pen.Color := clLime;
  Img.Picture.Bitmap.Canvas.Pen.Mode  := pmXor;
  Img.Picture.Bitmap.Canvas.Polyline([
    TPoint.Create(1, 1),
    TPoint.Create(Img.Width - 1, 1),
    TPoint.Create(Img.Width - 1, Img.Height - 1),
    TPoint.Create(1, Img.Height - 1),
    TPoint.Create(1, 1)]);
  Img.Picture.Bitmap.Canvas.Pen.Mode := pmCopy;
end;

/// <summary> Доступность действий </summary>
procedure TFm_Layer.AdjustActions();
begin
  Act_Cut         .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_Copy        .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_Paste       .Enabled :=  not FAppApi.IsTilesClipboardEmpty();
  Act_Delete      .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_Clear       .Enabled := (FImages.Count > 0);

  Act_SelectAll   .Enabled := (FImages.Count > 0);
  Act_DeselectAll .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_RotateLeft  .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_RotateRight .Enabled := (FImages.Count > 0) and FImages.HasSelected();
  Act_SetColor    .Enabled := (FImages.Count > 0) and FImages.HasSelected();
end;

end.
