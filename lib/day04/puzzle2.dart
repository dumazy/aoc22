class Puzzle2 {
  final String input;

  Puzzle2(this.input);

  int execute() {
    List<List<String>> pairs = getPairs();
    final overlappingPairs = pairs.where(overlap);
    return overlappingPairs.length;
  }

  List<List<String>> getPairs() {
    return input.split('\n').map((line) => line.split(',')).toList();
  }

  bool overlap(List<String> pair) {
    final firstRange = pair.first.split('-').map((e) => int.parse(e)).toList();
    final lastRange = pair.last.split('-').map((e) => int.parse(e)).toList();

    return firstRange.overlaps(lastRange) || lastRange.overlaps(firstRange);
  }
}

extension RangeExtensions on List<int> {
  bool isWithin(List<int> other) {
    return first >= other.first && last <= other.last;
  }

  bool overlaps(List<int> other) {
    return first >= other.first && first <= other.last;
  }
}
