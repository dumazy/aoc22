class Puzzle2 {
  final String input;

  Puzzle2(this.input);

  int execute() {
    final totals = calculateTotals();
    final sortedTotals = totals.asMap().entries.toList()
      ..sort(((a, b) => b.value - a.value));
    return sortedTotals
        .take(3)
        .map((entry) => entry.value)
        .reduce((total, calories) => total + calories);
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
