import 'package:aoc22/day12/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi""";

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 29);
    },
  );
}
