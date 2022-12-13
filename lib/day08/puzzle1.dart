import '../common/models.dart';

class Puzzle1 {
  final String input;
  final trees = <Point, int>{};
  final visibleTrees = <Point>{};

  Puzzle1(this.input);

  int execute() {
    final rows = input.split('\n');
    final numberOfRows = rows.length;
    final numberOfColumns = rows.first.length;

    // map trees
    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        trees.putIfAbsent(Point(row, column),
            () => int.parse(rows[row].substring(column, column + 1)));
      }
    }

    // visible from left
    for (var row = 0; row < numberOfRows; row++) {
      int highest = -1;
      for (var column = 0; column < numberOfColumns; column++) {
        final tree = Point(row, column);
        final height = trees[tree]!;
        if (height > highest) {
          visibleTrees.add(tree);
          highest = height;
        }
      }
    }

    // visible from top
    for (var column = 0; column < numberOfColumns; column++) {
      int highest = -1;
      for (var row = 0; row < numberOfRows; row++) {
        final tree = Point(row, column);
        final height = trees[tree]!;
        if (height > highest) {
          visibleTrees.add(tree);
          highest = height;
        }
      }
    }

    // visible from bottom
    for (var column = 0; column < numberOfColumns; column++) {
      int highest = -1;
      for (var row = numberOfRows - 1; row >= 0; row--) {
        final tree = Point(row, column);
        final height = trees[tree]!;
        if (height > highest) {
          visibleTrees.add(tree);
          highest = height;
        }
      }
    }

    // visible from right
    for (var row = 0; row < numberOfRows; row++) {
      int highestFromBottom = -1;
      for (var column = numberOfColumns - 1; column >= 0; column--) {
        final tree = Point(row, column);
        final height = trees[tree]!;
        if (height > highestFromBottom) {
          visibleTrees.add(tree);
          highestFromBottom = height;
        }
      }
    }

    return visibleTrees.length;
  }
}

bool isSidePoint(Point point) =>
    point.x == 0 || point.y == 0 || point.x == 4 || point.y == 4;
