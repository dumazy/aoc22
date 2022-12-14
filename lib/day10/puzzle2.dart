class Puzzle {
  final String input;
  int x = 1;
  final cycleValues = <int>[];

  Puzzle(this.input);

  String execute() {
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

    var output = "";
    cycleValues.asMap().forEach((cycle, value) {
      int position = cycle % 40;
      if (cycle != 0 && position == 0) {
        output += "\n";
      }
      if (position >= value - 1 && position <= value + 1) {
        output += "#";
      } else {
        output += ".";
      }
    });

    return output;
  }
}
