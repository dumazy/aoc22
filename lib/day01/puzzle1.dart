class Puzzle1 {
  final String input;

  Puzzle1(this.input);

  int execute() {
    final totals = calculateTotals();
    final sortedTotals = totals.asMap().entries.toList()
      ..sort(((a, b) => b.value - a.value));
    return sortedTotals.first.value;
  }

  List<int> calculateTotals() {
    return input
        .split('\n\n')
        .map((lines) => lines
            .split('\n')
            .map((line) => int.parse(line))
            .reduce((value, element) => value + element))
        .toList();
  }
}
