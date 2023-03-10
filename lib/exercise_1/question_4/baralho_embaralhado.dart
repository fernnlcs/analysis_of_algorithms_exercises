import 'dart:collection';
import 'dart:convert';
import 'dart:io';

void main() {
  final amountOfCards =
      int.tryParse(stdin.readLineSync(encoding: utf8) ?? '0') ?? 0;
  final cards = List.generate(amountOfCards, (index) => index);

  final original = cards.toString();
  var shuffleTimes = 0;
  shuffle(cards);

  while (cards.toString() != original) {
    shuffle(cards);
    shuffleTimes++;
  }

  print(shuffleTimes);
}

void shuffle(List<int> cards) {
  const amountOfParts = 2;
  final amountOfCards = cards.length;
  final cardsPerPart = amountOfCards ~/ amountOfParts;
  final parts = <Queue<int>>[];

  for (var i = 0; i < amountOfParts; i++) {
    parts
        .add(Queue.of(cards.sublist(i * cardsPerPart, (i + 1) * cardsPerPart)));
  }

  for (var i = 0; i < amountOfCards; i++) {
    cards[i] = parts[i % amountOfParts].removeFirst();
  }
}
