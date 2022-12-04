import 'package:aoc22/common/input_reader.dart';
import 'package:aoc22/day02/puzzle2.dart';

void main() async {
  final input = await readInput(2);
  final result = Puzzle2(input).execute();
  print('Result: $result');
}
