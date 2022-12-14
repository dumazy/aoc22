class Puzzle {
  final String input;
  int x = 1;
  final cycleValues = <int>[];

  Puzzle(this.input);

  int execute() {
    final commands = input.split('\n');
    for (var command in commands) {
      if (command.startsWith('noop')) {
        cycleValues.add(x);
      }
      if (command.startsWith('addx')) {
        int value = int.parse(command.split(' ').last);
        cycleValues.add(x);
        cycleValues.add(x);
        x += value;
      }
    }

    return [20, 60, 100, 140, 180, 220]
        .map((cycle) => cycleValues[cycle - 1] * cycle)
        .reduce((value, element) => value + element);
  }
}
