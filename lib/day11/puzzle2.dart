import 'dart:collection';

const rounds = 10000;

class Puzzle {
  final String input;
  late List<Monkey> monkeys;

  Puzzle(this.input) {
    final monkeyInputs = input.split('\n\n');
    monkeys = monkeyInputs.map(parseMonkeyInput).toList();
  }

  int execute() {
    for (var i = 0; i < rounds; i++) {
      for (var monkey in monkeys) {
        monkey.play();
      }
    }
    final totalInspects = monkeys.map((m) => m.numberOfInspects).toList()
      ..sort(((a, b) => b - a));
    return totalInspects[0] * totalInspects[1];
  }

  Monkey parseMonkeyInput(String input) {
    final lines = input.split('\n');
    final monkeyIndex =
        int.parse(lines[0].replaceAll("Monkey ", "").replaceAll(":", ""));
    final worryItems = lines[1]
        .replaceAll("  Starting items: ", "")
        .split(', ')
        .map(int.parse);
    final inspectInput = lines[2].replaceAll("  Operation: new = old ", "");
    final divisableBy =
        int.parse(lines[3].replaceAll("  Test: divisible by ", ""));
    final monkeyIfDivisible =
        int.parse(lines[4].replaceAll("    If true: throw to monkey ", ""));
    final monkeyIfNotDivisible =
        int.parse(lines[5].replaceAll("    If false: throw to monkey ", ""));

    final inspect = (int worry) {
      final operationParts = inspectInput.split(' ');
      final operator = operationParts.first;
      final operationValue = int.tryParse(operationParts.last) ?? worry;
      if (operator == '+') {
        return worry + operationValue;
      }
      return worry * operationValue;
    };
    final test = (int worry) {
      // int worry = monkeys[monkeyIndex].items.removeFirst();

      worry = worry % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19);
      // worry = worry % (13 * 17 * 19 * 23);

      if (worry % divisableBy == 0) {
        monkeys[monkeyIfDivisible].items.addLast(worry);
      } else {
        monkeys[monkeyIfNotDivisible].items.addLast(worry);
      }
    };

    final monkey = Monkey(inspect, test);
    worryItems.forEach((item) => monkey.items.addLast(item));
    return monkey;
  }
}

class Monkey {
  final Function inspect;
  final Function test;
  final Queue<int> items = Queue();
  var numberOfInspects = 0;

  Monkey(this.inspect, this.test);

  void play() {
    while (items.isNotEmpty) {
      var worry = items.removeFirst();
      worry = inspect(worry);
      numberOfInspects++;
      // worry = worry ~/ 3;
      test(worry);
    }
  }
}
