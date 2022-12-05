import 'dart:math';

class Puzzle2 {
  final String input;

  Puzzle2(this.input);

  int execute() {
    final compartments = getGroups();
    final sharedItems = compartments.map(getSharedItem);
    final priorities = sharedItems.map(getPriority);
    return priorities.reduce((value, element) => value + element);
  }

  List<List<String>> getGroups() {
    final rucksacks = input.split('\n');
    final groups = <List<String>>[];
    for (int i = 0; i < rucksacks.length; i += 3) {
      groups.add(rucksacks.sublist(i, min(rucksacks.length, i + 3)));
    }
    return groups;
  }

  String getSharedItem(List<String> group) {
    final characters = group.first.split('');
    for (String character in characters) {
      if (group.every((rucksack) => rucksack.contains(character))) {
        return character;
      }
    }
    throw "No shared item found";
  }

  int getPriority(String character) {
    if (character.toLowerCase() == character) {
      return character.codeUnits.first - 'a'.codeUnits.first + 1;
    } else {
      return character.codeUnits.first - 'A'.codeUnits.first + 27;
    }
  }
}
