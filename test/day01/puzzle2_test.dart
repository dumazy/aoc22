import 'package:day_01/day01/puzzle2.dart';
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
  late Puzzle2 puzzle;

  setUp(() {
    puzzle = Puzzle2(testInput);
  });

  test(
    'Find total 3 most calories',
    () {
      final result = puzzle.execute();
      expect(result, 45000);
    },
  );
}
