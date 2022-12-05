import 'package:aoc22/day03/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw""";

void main() {
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
  });

  test(
    'Rucksacks with compartments',
    () {
      final result = puzzle.getCompartments();

      expect(result.take(3).toList(), [
        ['vJrwpWtwJgWr', 'hcsFMMfFFhFp'],
        ['jqHRNqRjqzjGDLGL', 'rsFMfFZSrLrFZsSL'],
        ['PmmdzqPrV', 'vPwwTWBwg'],
      ]);
    },
  );

  test(
    'Shared item',
    () {
      const rucksack = ['vJrwpWtwJgWr', 'hcsFMMfFFhFp'];
      final result = puzzle.getSharedItem(rucksack);
      expect(result, 'p');
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
      expect(result, 157);
    },
  );
}
