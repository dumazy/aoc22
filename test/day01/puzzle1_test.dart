import 'package:day_01/day01/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """1000
2000
3000

4000

5000
6000

7000
8000
9000

10000""";

void main() {
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
  });

  test(
    'Group totals',
    () {
      final result = puzzle.calculateTotals();
      expect(result, [6000, 4000, 11000, 24000, 10000]);
    },
  );
  test(
    'Find most calories',
    () {
      final result = puzzle.execute();
      expect(result, 24000);
    },
  );
}
