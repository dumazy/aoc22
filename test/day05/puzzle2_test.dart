import 'package:aoc22/day05/puzzle2.dart';
import 'package:test/test.dart';

const testInput = """    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2""";

void main() {
  late Puzzle2 puzzle;

  setUp(() {
    puzzle = Puzzle2(testInput);
  });

  test(
    'Get stacks',
    () {
      final result = puzzle.getStacks(testInput.split('\n\n').first);
      expect(result, [
        'ZN',
        'MCD',
        'P',
      ]);
    },
  );

  test(
    'extract procedure data',
    () {
      final result = puzzle.extractDataFromProcedure("move 1 from 4 to 1");
      expect(result, [1, 4, 1]);
    },
  );

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 'MCD');
    },
  );
}
