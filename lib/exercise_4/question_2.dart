void main(List<String> args) {
  final v = [3, 1, 4, 8];
  final result = sum(v.join('\n'));

  print('Soma = $result');
}

int sum(final String entry) {
  final parts = entry.split('\n').map((e) => int.parse(e)).toList();
  final quantity = parts[0];
  final values = parts.sublist(1);

  if (quantity == 1) {
    return values[0];
  }

  final halfIndex = quantity ~/ 2;
  final firstHalf = values.sublist(0, halfIndex);
  final secondHalf = values.sublist(halfIndex);

  firstHalf.insert(0, firstHalf.length);
  secondHalf.insert(0, secondHalf.length);

  return sum(firstHalf.join('\n')) + sum(secondHalf.join('\n'));
}
