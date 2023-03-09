import 'package:analysis_of_algorithms_exercises/exercise_1/question_2/pair.dart';
import 'package:analysis_of_algorithms_exercises/exercise_1/question_2/point.dart';

void main(List<String> args) {
  var distances = <double, List<Pair>>{};
  var plane = [
    Point(5, 3),
    Point(1, 0),
    Point(23, 6),
    Point(17, 1),
    Point(8, -7),
    Point(0, 25),
    Point(-3, 2),
    Point(-7, 4),
  ];

  for (var i = 0; i < plane.length; i++) {
    for (var j = i + 1; j < plane.length; j++) {
      final pair = Pair(plane[i], plane[j]);
      final distance = pair.getDistance();

      if (distances.containsKey(distance)) {
        distances[distance]!.add(pair);
      } else {
        distances[distance] = [pair];
      }
    }
  }

  var keys = distances.keys.toList();

  keys.sort((a, b) {
    if (a < b) {
      return -1;
    } else if (a > b) {
      return 1;
    }
    return 0;
  });

  final closestPairs = distances[keys.first];

  print('A menor distância é ${keys.first.toStringAsFixed(4)} entre os pares $closestPairs');
}
