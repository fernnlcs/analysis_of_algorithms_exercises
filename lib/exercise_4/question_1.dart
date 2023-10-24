int comparisons = 0;

void main(List<String> args) {
  final v = [0, 1, 2, 3, 4];
  final result = maximo(v, 1, 3);

  print('Máximo: v[$result]');
  print('Comparações: $comparisons');
}

int maximo(final List<int> v, final int i, final int f) {
  if (i == f) {
    return i;
  }

  final p = maximo(v, i, (i + f) ~/ 2);
  final q = maximo(v, (i + f) ~/ 2 + 1, f);

  comparisons++;
  if (v[p] >= v[q]) {
    return p;
  }

  return q;
}
