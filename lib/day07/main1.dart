import '../common/input_reader.dart';
import 'puzzle1.dart';

void main() async {
  final input = await readInput(7);
  final result = Puzzle(input).execute();
  print('Result: $result');
}
