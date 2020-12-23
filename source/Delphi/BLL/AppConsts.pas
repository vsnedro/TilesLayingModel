unit AppConsts;
{===============================================================================
  Unit        : AppConsts
  Description : Constants
  Описание    : Константы
===============================================================================}

interface

uses
  {App}
  AppTypes;

const
  /// <summary> Tile type </summary>
  /// <summary> Тип плитки </summary>
  CTileName : array [TTileKind] of String = (
    'Triangle',
    'Square',
    'Hexagon',
    'Octagon'
  );

implementation

end.
