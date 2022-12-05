import 'package:aoc22/day04/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8""";

void main() {
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
  });

  test(
    'Get pairs',
    () {
      final pairs = puzzle.getPairs();
      expect(pairs, [
        ['2-4', '6-8'],
        ['2-3', '4-5'],
        ['5-7', '7-9'],
        ['2-8', '3-7'],
        ['6-6', '4-6'],
        ['2-6', '4-8'],
      ]);
    },
  );

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 2);
    },
  );
}
