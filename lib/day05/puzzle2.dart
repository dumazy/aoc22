import 'dart:math';

class Puzzle2 {
  final String input;

  Puzzle2(this.input);

  String execute() {
    final parts = input.split('\n\n');
    final stacks = getStacks(parts.first);
    final movedStacks = executeProcedures(parts.last, stacks);
    return movedStacks.map((stack) => stack.substring(stack.length - 1)).join();
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

  List<String> executeProcedures(String procedureInput, List<String> stacks) {
    final procedures = procedureInput.split('\n');
    for (String procedure in procedures) {
      final data = extractDataFromProcedure(procedure);
      final fromIndex = data[1] - 1;
      final toIndex = data[2] - 1;
      final from = stacks[fromIndex].split('');
      final to = stacks[toIndex].split('');
      final amount = data[0];
      final crates = from.sublist(from.length - amount);
      to.addAll(crates);
      stacks[fromIndex] = from.sublist(0, from.length - amount).join();
      stacks[toIndex] = to.join();
    }
    return stacks;
  }

  List<int> extractDataFromProcedure(String procedure) {
    //move 1 from 4 to 1
    final regex = RegExp(r'^move ([0-9]+) from ([0-9]) to ([0-9])$');
    final match = regex.firstMatch(procedure)!;
    return [
      match.group(1),
      match.group(2),
      match.group(3),
    ].map((e) => int.parse(e!)).toList();
  }
}
