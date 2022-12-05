import '../common/input_reader.dart';
import 'puzzle2.dart';

void main() async {
  final input = await readInput(4);
  final result = Puzzle2(input).execute();
  print('Result: $result');
}
