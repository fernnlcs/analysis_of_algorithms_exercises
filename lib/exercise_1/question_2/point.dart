class Point {
  static String nextName = String.fromCharCode('a'.codeUnits.single - 1);

  final String name =
      nextName = String.fromCharCode(nextName.codeUnits.single + 1);
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  String toString() => '$name = ($x, $y)';
}
