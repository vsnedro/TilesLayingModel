unit TileRepository;
{ ===============================================================================
  Модуль      : TileRepository
  Description : Tile repository
  Описание    : Репозиторий для плиток
  =============================================================================== }

interface

uses
  {App}
  Tiles;

type
  /// <summary>
  /// <para> Tile repository </para>
  /// <para> Репозиторий для плиток </para>
  /// </summary>
  TTileFileRepository = class(TObject)
  strict private
    {}
  strict protected
    {}
  public
    /// <summary> Load from file </summary>
    /// <summary> Загрузить из файла </summary>
    function Load(
      const AFileName : String) : TTileList;
    /// <summary> Save to file </summary>
    /// <summary> Сохранить в файл </summary>
    procedure Save(
      const AList     : TTileList;
      const AFileName : String);
  end; { TTileFileRepository }

implementation

uses
  {VCL}
  System.IniFiles,
  System.SysUtils,
  System.Types,
  {App}
  AppTypes;

{------------------------------------------------------------------------------}
{ TTileFileRepository }
{------------------------------------------------------------------------------}

/// <summary> Load from file </summary>
/// <summary> Загрузить из файла </summary>
function TTileFileRepository.Load(
  const AFileName : String) : TTileList;
var
  Tile : TTile;
begin
  Result := TTileList.Create();
  try
    if FileExists(AFileName) then
    begin
      var F := TMemIniFile.Create(AFileName);
      try
        // read the number of tiles
        // читаем количество плиток
        var N := F.ReadInteger('General', 'Count', 0);

        // read tile data
        // читаем данные о плитках
        for var i := 0 to N - 1 do
        begin
          var S := 'Tile' + i.ToString();
          if F.SectionExists(S) then
          begin
            Tile := TTile.Create(
              {AKind  }TTileKind(F.ReadInteger(S, 'Kind', 0)),
              {AColor }F.ReadInteger(S, 'Color', 0),
              {ARect  }TRect.Create(
                {Left   }F.ReadInteger(S, 'Left',   0),
                {Top    }F.ReadInteger(S, 'Top',    0),
                {Right  }F.ReadInteger(S, 'Right',  0),
                {Bottom }F.ReadInteger(S, 'Bottom', 0)),
              {AAngle }F.ReadInteger(S, 'Angle', 0));
            Result.Add(Tile);
          end;
        end;
      finally
        FreeAndNil(F);
      end;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

/// <summary> Save to file </summary>
/// <summary> Сохранить в файл </summary>
procedure TTileFileRepository.Save(
  const AList     : TTileList;
  const AFileName : String);
begin
  var F := TMemIniFile.Create(AFileName);
  try
    // delete old data
    // удаляем старые данные
    var i := 0;
    var S := 'Tile' + i.ToString();
    while F.SectionExists(S) do
    begin
      F.EraseSection(S);
      Inc(i);
      S := 'Tile' + i.ToString();
    end;

    // save the number of tiles
    // сохраняем количество плиток
    F.WriteInteger('General', 'Count', AList.Count);
    // save data about tiles
    // сохраняем данные о плитках
    for var tile in AList do
    begin
      S := 'Tile' + IntToStr(i);
      F.WriteInteger(S, 'Kind',   Ord(tile.Kind));
      F.WriteInteger(S, 'Color',  tile.Color);
      F.WriteInteger(S, 'Left',   tile.Rect.Left);
      F.WriteInteger(S, 'Top',    tile.Rect.Top);
      F.WriteInteger(S, 'Right',  tile.Rect.Right);
      F.WriteInteger(S, 'Bottom', tile.Rect.Bottom);
      F.WriteInteger(S, 'Angle',  tile.Angle);
    end;

    F.UpdateFile();
  finally
    FreeAndNil(F);
  end;
end;

end.
