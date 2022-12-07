class Puzzle {
  final String input;

  Puzzle(this.input);

  String directory = "/";

  Map<String, int> files = {};

  int execute() {
    final lines = input.split('\n').toList();
    for (final line in lines) {
      print('current directory: $directory');
      print('processing line: $line');
      if (executeCommand(line)) {
        continue;
      }
      if (registerFile(line)) {
        continue;
      }
    }

    final directorySizes = calculateDirectorySizes();
    return directorySizes.values
        .where((element) => element < 100000)
        .reduce((value, element) => value + element);
  }

  bool executeCommand(String line) {
    if (!line.startsWith('\$')) {
      return false;
    }
    if (line.startsWith('\$ cd ')) {
      final path = line.substring('\$ cd '.length);
      if (path == '/') {
        // nothing required, is only first in input
        return true;
      }
      if (path == '..') {
        final indexLastSlash =
            directory.substring(0, directory.length - 2).lastIndexOf('/');
        directory = directory.substring(0, indexLastSlash + 1);
        return true;
      } else {
        directory += '$path/';
      }
    }
    // ls doesn't require anything
    return true;
  }

  bool registerFile(String line) {
    if (line.startsWith('dir')) {
      return true;
    }
    final parts = line.split(' ');
    final bytes = int.parse(parts.first);
    final name = parts.last;
    files['$directory$name'] = bytes;
    return true;
  }

  Map<String, int> calculateDirectorySizes() {
    final directorySizes = <String, int>{};
    for (final fileEntry in files.entries) {
      final filePath = fileEntry.key;
      final bytes = fileEntry.value;
      final directories = filePath.split('/')..removeLast();
      String currentDir = "";
      for (final dir in directories) {
        if (dir.isEmpty) continue;
        currentDir += '/$dir';
        directorySizes.update(
          currentDir,
          (previousBytes) => bytes + previousBytes,
          ifAbsent: () => bytes,
        );
      }
    }
    return directorySizes;
  }
}
