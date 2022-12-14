import 'package:aoc22/day09/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20""";

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 36);
    },
  );
}
