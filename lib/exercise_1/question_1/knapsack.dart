import 'package:analysis_of_algorithms_exercises/exercise_1/question_1/item.dart';

class Knapsack {
  static const maxCapacity = 15;
  List<Item> items = [];

  double getTotalWeight() {
    double sum = 0;

    for (Item item in items) {
      sum += item.weight;
    }

    return sum;
  }

  double getTotalValue() {
    double sum = 0;

    for (Item item in items) {
      sum += item.value;
    }

    return sum;
  }

  bool isValid() {
    return getTotalWeight() <= maxCapacity;
  }
}
