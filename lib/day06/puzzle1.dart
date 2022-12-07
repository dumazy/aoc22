class Puzzle1 {
  final String input;

  Puzzle1(this.input);

  int execute() {
    const numberOfDistinctCharacters = 4;
    for (var i = 0; i < input.length; i++) {
      final end = i + numberOfDistinctCharacters;
      final lastCharacters = input.substring(i, end);
      final asSet = lastCharacters.split('').toSet();
      if (asSet.length == numberOfDistinctCharacters) {
        return end;
      }
    }
    return 0;
  }
}
