import 'package:aoc22/day05/puzzle1.dart';
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
  late Puzzle1 puzzle;

  setUp(() {
    puzzle = Puzzle1(testInput);
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
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 'CMZ');
    },
  );
}
