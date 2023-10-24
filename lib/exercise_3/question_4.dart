import 'dart:convert';
import 'dart:io';

enum Action { up, left, down, right }

void main(List<String> args) {
  var input = stdin.readLineSync(encoding: utf8) ?? '0';
  final lines = <String>[input];
  final quantity = int.parse(input);

  for (var i = 0; i < (quantity * 6); i++) {
    input = stdin.readLineSync(encoding: utf8) ?? '0';
    lines.add(input);
  }

  final matrixes = read(lines.join('\n'));
  var answers = <String>[];

  for (var matrix in matrixes) {
    answers.add(resolve(matrix));
  }

  answers.forEach(print);
}

List<List<List<bool>>> read(final String entry) {
  final parts = entry.split('\n\n');
  final quantity = int.parse(parts[0]);
  final result = <List<List<bool>>>[];

  for (var i = 1; i <= quantity; i++) {
    final matrix = parts[i];
    final lines = matrix.split('\n');

    result.add(lines
        .map((line) =>
            line.split(' ').map((character) => character == '1').toList())
        .toList());
  }

  return result;
}

String resolve(final List<List<bool>> matrix) {
  bool search(final int line, final int column, final Action lastAction) {
    if (line == 4 && column == 4) {
      return true;
    }

    // Pode ir para a direita
    if (column < 4 && !matrix[line][column + 1] && lastAction != Action.left) {
      final result = search(line, column + 1, Action.right);
      if (result) {
        return true;
      }
    }

    // Pode descer
    if (line < 4 && !matrix[line + 1][column] && lastAction != Action.up) {
      final result = search(line + 1, column, Action.down);
      if (result) {
        return true;
      }
    }

    // Pode ir para a esquerda
    if (column < 0 && !matrix[line][column - 1] && lastAction != Action.right) {
      final result = search(line, column - 1, Action.left);
      if (result) {
        return true;
      }
    }

    // Pode subir
    if (line > 0 && !matrix[line - 1][column] && lastAction != Action.down) {
      final result = search(line - 1, column, Action.up);
      if (result) {
        return true;
      }
    }

    return false;
  }

  return search(0, 0, Action.right) ? 'COPS' : 'ROBBERS';
}
