import 'package:aoc22/day06/puzzle2.dart';
import 'package:test/test.dart';

void main() {

  test(
    'Example result',
    () {
      expect(Puzzle2("mjqjpqmgbljsphdztnvjfqwrcgsmlb").execute(), 19);
      expect(Puzzle2("bvwbjplbgvbhsrlpgdmjqwftvncz").execute(), 23);
      expect(Puzzle2("nppdvjthqldpwncqszvftbrmjlhg").execute(), 23);
      expect(Puzzle2("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").execute(), 29);
      expect(Puzzle2("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").execute(), 26);
    },
  );
}
