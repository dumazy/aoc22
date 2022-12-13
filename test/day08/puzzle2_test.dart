import 'package:aoc22/common/models.dart';
import 'package:aoc22/day08/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """30373
25512
65332
33549
35390""";

void main() {
  late Puzzle2 puzzle;

  setUp(() {
    puzzle = Puzzle2(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 8);
    },
  );

  test(
    'Scenic score for Point(3,2) should be 8',
    () {
      puzzle.execute();
      final result = puzzle.scenicScore(Point(3, 2));
      expect(result, 8);
    },
  );
}
