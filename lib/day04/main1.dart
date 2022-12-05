import '../common/input_reader.dart';
import 'puzzle1.dart';

void main() async {
  final input = await readInput(4);
  final result = Puzzle1(input).execute();
  print('Result: $result');
}
