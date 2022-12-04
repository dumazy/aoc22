import 'dart:io';

Future<String> readInput(int day) async {
  final dayNumber = day.toString().padLeft(2, '0');
  final file = File('./assets/input/$dayNumber.txt');
  return file.readAsString();
}
