import 'package:aoc22/day02/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """A Y
B X
C Z""";

void main() {
  late Puzzle2 puzzle;

  setUp(() {
    puzzle = Puzzle2(testInput);
  });

  test(
    'Result strategy guide',
    () {
      final result = puzzle.execute();
      expect(result, 12);
    },
  );
}
