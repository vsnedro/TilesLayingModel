unit Tiles;
{ ===============================================================================
  Модуль      : Tiles
  Description : Tiles
  Описание    : Плитки
  =============================================================================== }

interface

uses
  {VCL}
  System.Types,
  System.UITypes,
  System.Generics.Collections,
  {App}
  AppTypes;

type
  /// <summary>
  /// <para> Tile </para>
  /// <para> Плитка </para>
  /// </summary>
  TTile = class(TObject)
  strict private
    /// <summary> Identifier </summary>
    /// <summary> Идентификатор </summary>
    FID: TGUID;
    /// <summary> Tile type </summary>
    /// <summary> Тип плитки </summary>
    FKind: TTileKind;
    /// <summary> Color </summary>
    /// <summary> Цвет </summary>
    FColor: TColor;
    /// <summary> Shape coordinates </summary>
    /// <summary> Координаты фигуры </summary>
    FRect: TRect;
    /// <summary> Angle of rotation </summary>
    /// <summary> Угол поворота </summary>
    FAngle: Integer;
    /// <summary> Selection flag </summary>
    /// <summary> Признак выбора </summary>
    FSelected: Boolean;
    /// <summary> Vertex coordinates </summary>
    /// <summary> Координаты вершин </summary>
    FCoords: TArray<TPoint>;
  strict protected
    {}
  public
    /// <summary> Class constructor </summary>
    /// <summary> Конструктор класса </summary>
    constructor Create(
      const AKind     : TTileKind;
      const AColor    : TColor;
      const ARect     : TRect;
      const AAngle    : Integer = 0;
      const ASelected : Boolean = False);

    /// <summary> Identifier </summary>
    /// <summary> Идентификатор </summary>
    property ID: TGUID read FID;
    /// <summary> Tile type </summary>
    /// <summary> Тип плитки </summary>
    property Kind: TTileKind read FKind;
    /// <summary> Color </summary>
    /// <summary> Цвет </summary>
    property Color: TColor read FColor write FColor;
    /// <summary> Shape coordinates </summary>
    /// <summary> Координаты фигуры </summary>
    property Rect: TRect read FRect;
    /// <summary> Angle of rotation </summary>
    /// <summary> Угол поворота </summary>
    property Angle: Integer read FAngle write FAngle;
    /// <summary> Selection flag </summary>
    /// <summary> Признак выбора </summary>
    property Selected: Boolean read FSelected write FSelected;
    /// <summary> Vertex coordinates </summary>
    /// <summary> Координаты вершин </summary>
    property Coords: TArray<TPoint> read FCoords;
  end; { TTile }

type
  /// <summary>
  /// <para> List of tiles </para>
  /// <para> Список плиток </para>
  /// </summary>
  TTileList = class(TObjectList<TTile>);

implementation

uses
  {VCL}
  System.SysUtils;

{------------------------------------------------------------------------------}
{ TTile }
{------------------------------------------------------------------------------}

/// <summary> Class constructor </summary>
/// <summary> Конструктор класса </summary>
constructor TTile.Create(
  const AKind     : TTileKind;
  const AColor    : TColor;
  const ARect     : TRect;
  const AAngle    : Integer = 0;
  const ASelected : Boolean = False);
begin
  inherited Create();

  FID       := TGUID.NewGuid();
  FKind     := AKind;
  FColor    := AColor;
  FRect     := ARect;
  FAngle    := AAngle;
  FSelected := ASelected;

  case AKind of
    // Triangle
    // Треугольник
    tkTriangle :
      SetLength(FCoords, 3);

    // Square
    // Квадрат
    tkSquare   :
      SetLength(FCoords, 4);

    // Hexagon
    // Шестиугольник
    tkHexagon  :
      SetLength(FCoords, 6);

    // Octagon
    // Восьмиугольник
    tkOctagon  :
      SetLength(FCoords, 8);
  end;
end;

end.
