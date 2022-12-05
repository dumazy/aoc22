import 'package:aoc22/day03/puzzle1.dart';
import 'package:aoc22/day03/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw""";

void main() {
  late Puzzle2 puzzle;

  setUp(() {
    puzzle = Puzzle2(testInput);
  });

  test(
    'Groups of rucksacks',
    () {
      final result = puzzle.getGroups();

      expect(result.take(3).toList(), [
        [
          'vJrwpWtwJgWrhcsFMMfFFhFp',
          'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
          'PmmdzqPrVvPwwTWBwg',
        ],
        [
          'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
          'ttgJtRGJQctTZtZT',
          'CrZsJsPPZsGzwwsLwLmpwMDw',
        ],
      ]);
    },
  );

  test(
    'Shared item',
    () {
      const group = [
        'vJrwpWtwJgWrhcsFMMfFFhFp',
        'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
        'PmmdzqPrVvPwwTWBwg',
      ];
      final result = puzzle.getSharedItem(group);
      expect(result, 'r');
    },
  );

  test(
    'Priority of item',
    () {
      expect(puzzle.getPriority('a'), 1);
      expect(puzzle.getPriority('z'), 26);
      expect(puzzle.getPriority('A'), 27);
      expect(puzzle.getPriority('Z'), 52);
    },
  );

  test(
    'Total priority of shared types',
    () {
      final result = puzzle.execute();
      expect(result, 70);
    },
  );
}
