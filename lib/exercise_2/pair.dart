// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:analysis_of_algorithms_exercises/exercise_2/point.dart';

class Pair {
  final Point a;
  final Point b;

  Pair(this.a, this.b);

  double getDistance() {
    return sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2));
  }

  @override
  String toString() => '($a, $b)';
}
