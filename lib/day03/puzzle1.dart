class Puzzle1 {
  final String input;

  Puzzle1(this.input);

  int execute() {
    final compartments = getCompartments();
    final sharedItems = compartments.map(getSharedItem);
    final priorities = sharedItems.map(getPriority);
    return priorities.reduce((value, element) => value + element);
  }

  List<List<String>> getCompartments() {
    return input.split('\n').map((rucksack) {
      final middle = rucksack.length ~/ 2;
      return [
        rucksack.substring(0, middle),
        rucksack.substring(middle),
      ];
    }).toList();
  }

  String getSharedItem(List<String> compartments) {
    final characters = compartments.first.split('');
    for (String character in characters) {
      if (compartments.last.contains(character)) return character;
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
