import 'package:aoc22/common/input_reader.dart';
import 'puzzle2.dart';

void main() async {
  final input = await readInput(2);
  final result = Puzzle2(input).execute();
  print('Result: $result');
}
