import 'package:aoc22/day08/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """30373
25512
65332
33549
35390""";

void main() {
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 21);
    },
  );
}
