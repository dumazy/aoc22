import 'package:aoc22/day11/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1""";

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 2713310158);
    },
  );
}


/**
 * After 20 rounds
 * Monkey 0 inspected items 99 times.
Monkey 1 inspected items 97 times.
Monkey 2 inspected items 8 times.
Monkey 3 inspected items 103 times.
 */

// + values = 3, 4, 6, 7, 8
// 3 + 4