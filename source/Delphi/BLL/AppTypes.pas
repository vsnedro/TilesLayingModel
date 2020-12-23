unit AppTypes;
{===============================================================================
  Unit        : AppTypes
  Description : Data types
  Описание    : Типы данных
===============================================================================}

interface

type
  /// <summary>
  /// <para> Tile type </para>
  /// <para> Тип плитки </para>
  /// </summary>
  TTileKind = (
    /// <summary> Треугольник </summary>
    /// <summary> Triangle </summary>
    tkTriangle,
    /// <summary> Square </summary>
    /// <summary> Квадрат </summary>
    tkSquare,
    /// <summary> Hexagon </summary>
    /// <summary> Шестиугольник </summary>
    tkHexagon,
    /// <summary> Octagon </summary>
    /// <summary> Восьмиугольник </summary>
    tkOctagon
  );

implementation

end.
