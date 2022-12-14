import 'package:aoc22/common/models.dart';
import 'package:aoc22/day09/puzzle1.dart';
import 'package:test/test.dart';

const testInput = """R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2""";

void main() {
  late Puzzle puzzle;

  setUp(() {
    puzzle = Puzzle(testInput);
  });

  test(
    'Example result',
    () {
      final result = puzzle.execute();
      expect(result, 13);
    },
  );

  test(
    'keep up moving right',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(0, 0));
      expect(result, Point(1, 0));
    },
  );

  test(
    'keep up moving left',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(4, 0));
      expect(result, Point(3, 0));
    },
  );

  test(
    'keep up stay left',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(1, 0));
      expect(result, Point(1, 0));
    },
  );

  test(
    'keep up stay right',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(3, 0));
      expect(result, Point(3, 0));
    },
  );

  test(
    'keep up stay top',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(2, -1));
      expect(result, Point(2, -1));
    },
  );

  test(
    'keep up stay down right',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(3, 1));
      expect(result, Point(3, 1));
    },
  );

  test(
    'keep up stay top left',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(1, -1));
      expect(result, Point(1, -1));
    },
  );

  test(
    'keep up moving down',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(2, -2));
      expect(result, Point(2, -1));
    },
  );

  test(
    'keep up moving up',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(2, 2));
      expect(result, Point(2, 1));
    },
  );

  test(
    'keep up moving down left',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(1, -2));
      expect(result, Point(2, -1));
    },
  );

  test(
    'keep up moving up right',
    () {
      final result = puzzle.keepUp(Point(2, 0), Point(1, 2));
      expect(result, Point(2, 1));
    },
  );
}
