void main(List<String> args) {
  final String entry = '''
5 1 5 3 4 2
5 5 1 3 4 2
5 1 2 3 4 5
6 3 5 2 1 4 6
5 5 4 3 2 1
6 6 5 4 3 2 1
0''';

  var testCases = entry.split('\n').map((row) {
    var values = row.split(' ').map((n) => int.parse(n)).toList();
    values.removeAt(0);
    return values;
  }).toList();
  testCases.removeLast();

  for (var testCase in testCases) {
    var moveNumber = 0;

    var index = getFirstMove(testCase);
    while (index != -1) {
      move(testCase, index);
      moveNumber++;
      index = getFirstMove(testCase);
    }

    print((moveNumber % 2 == 0) ? 'Carlos' : 'Marcelo');
  }
}

int getFirstMove(final List<int> list) {
  for (var i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      return i;
    }
  }
  return -1;
}

void move(final List<int> list, final int i) {
  final temp = list[i];
  list[i] = list[i + 1];
  list[i + 1] = temp;
}
