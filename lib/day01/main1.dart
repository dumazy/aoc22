import 'package:day_01/common/input_reader.dart';
import 'package:day_01/day01/puzzle1.dart';

void main() async {
  final input = await readInput(1);
  final result = Puzzle1(input).execute();
  print('Result: $result');
}
