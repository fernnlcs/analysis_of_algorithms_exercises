class Item {
  static var _currentId = 0;

  final int id;
  final double weight;
  final double value;

  Item(this.weight, this.value) : id = _currentId++;

  @override
  String toString() => '#$id';
}
