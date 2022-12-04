import 'package:aoc22/common/input_reader.dart';
import 'package:aoc22/day02/puzzle1.dart';

void main() async {
  final input = await readInput(2);
  final result = Puzzle1(input).execute();
  print('Result: $result');
}
