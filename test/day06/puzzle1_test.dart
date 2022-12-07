import 'package:aoc22/day06/puzzle1.dart';
import 'package:test/test.dart';

void main() {
  late Puzzle1 puzzle;

  test(
    'Example result',
    () {
      expect(Puzzle1("mjqjpqmgbljsphdztnvjfqwrcgsmlb").execute(), 7);
      expect(Puzzle1("bvwbjplbgvbhsrlpgdmjqwftvncz").execute(), 5);
      expect(Puzzle1("nppdvjthqldpwncqszvftbrmjlhg").execute(), 6);
      expect(Puzzle1("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").execute(), 10);
      expect(Puzzle1("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").execute(), 11);
    },
  );
}
