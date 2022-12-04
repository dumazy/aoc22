import 'package:aoc22/day02/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """A Y
B X
C Z""";

void main() {
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
  });

  test(
    'Result strategy guide',
    () {
      final result = puzzle.execute();
      expect(result, 15);
    },
  );

  test(
    'More attempts from real input',
    () {
      const input = """A Y
B Z
C Y
B Y
A Y
A Y
A X
A Y
B Z""";
      final result = Puzzle1(input).execute();
// A Y : 2 + 6
// B Z : 3 + 6
// C Y : 2 + 0
// B Y : 2 + 3
// A Y : 2 + 6
// A Y : 2 + 6
// A X : 1 + 3
// A Y : 2 + 6
// B Z : 3 + 6
      const expected =
          2 + 6 + 3 + 6 + 2 + 0 + 2 + 3 + 2 + 6 + 2 + 6 + 1 + 3 + 2 + 6 + 3 + 6;
      expect(result, expected);
    },
  );
}
