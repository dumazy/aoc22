import 'dart:math';

class Puzzle1 {
  final String input;

  Puzzle1(this.input);

  String execute() {
    final parts = input.split('\n\n');
    final stacks = getStacks(parts.first);
    final procedureInput = parts.last;

    return '';
  }

  List<String> getStacks(String stacksInput) {
    final rows = stacksInput.split('\n');
    rows.removeAt(rows.length - 1);

    final amountOfStacks = (rows.first.length + 1) ~/ 4;
    final stacks = List<String>.filled(amountOfStacks, '');

    for (String row in rows) {
      final crates = <String>[];
      for (int i = 0; i < row.length; i += 4) {
        crates.add(row.substring(i, min(row.length, i + 4)));
      }

      int stackIndex = -1;
      for (String crate in crates) {
        print('crate: $crate');
        ++stackIndex;
        if (crate.isEmpty) continue;
        final crateLetter = crate.substring(1, 2);
        stacks[stackIndex] = crateLetter.trim() + stacks[stackIndex];
      }
    }

    return stacks;
  }
}
