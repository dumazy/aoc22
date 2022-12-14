import 'package:aoc22/day00/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """changethis""";

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 0000);
    },
  );
}
