import 'package:analysis_of_algorithms_exercises/exercise_1/question_1/item.dart';
import 'package:analysis_of_algorithms_exercises/exercise_1/question_1/knapsack.dart';

void main(List<String> args) {
  final knapsack = Knapsack();
  final store = [Item(12, 4), Item(1, 1), Item(2, 2), Item(1, 2), Item(4, 10)];

  bruteForce(knapsack, store);

  print(
      'A melhor combinação é a dos itens ${knapsack.items} cujo peso é ${knapsack.getTotalWeight()} e o valor é \$${knapsack.getTotalValue()}');
}

void bruteForce(Knapsack knapsack, List<Item> store) {
  var totalAmountOfItems = store.length;
  List<List<Item>> combinations = [];

  // Gerar listas de n itens
  for (int max = 0; max <= totalAmountOfItems; max++) {
    List<Item> accumulator = [];
    generate(store, combinations, accumulator, max, -1);
  }

  for (List<Item> combination in combinations) {
    Knapsack test = Knapsack();
    test.items = combination;

    if (test.isValid() && test.getTotalValue() > knapsack.getTotalValue()) {
      knapsack.items = combination;
    }
  }
}

void generate(List<Item> store, List<List<Item>> combinations,
    List<Item> accumulator, int max, int last) {
  if (max == 0) {
    combinations.add([...accumulator]);
  }
  for (int i = last + 1; i < store.length; i++) {
    if (accumulator.length < max) {
      accumulator.add(store[++last]);
      generate(store, combinations, accumulator, max, last);

      if (accumulator.length >= max) {
        combinations.add([...accumulator]);
      }

      accumulator.remove(store[last]);
    }
  }
}
