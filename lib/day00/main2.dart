import '../common/input_reader.dart';
import 'puzzle2.dart';

void main() async {
  final input = await readInput(0);
  final result = Puzzle(input).execute();
  print('Result: $result');
}
