import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  var input = stdin.readLineSync(encoding: utf8) ?? '0';
  final result = <String>[];

  while (input != '0') {
    result.add(generate(int.parse(input)));
    input = stdin.readLineSync(encoding: utf8) ?? '0';
  }

  result.add(generate(0));

  print(result.join('\n'));
}

String generate(final int size) {
  bool isValid(final String subsegment) {
    final subSize = subsegment.length;

    for (var i = 1; i <= (subSize / 2); i++) {
      final lastPart = subsegment.substring(subSize - i);
      final previousPart = subsegment.substring(subSize - (i * 2), subSize - i);
      if (lastPart == previousPart) {
        return false;
      }
    }

    return true;
  }

  String addNext(final String subsegment) {
    const possibilities = ['N', 'O', 'P'];

    if (subsegment.length == size) {
      return subsegment;
    }

    for (var possibility in possibilities) {
      final candidate = subsegment + possibility;

      if (isValid(candidate)) {
        try {
          return addNext(candidate);
        } catch (e) {
          // Ignorar
        }
      }
    }

    throw Exception('Repetiu');
  }

  String sequence = addNext('');

  return sequence;
}
