import 'dart:math';

import '../common/models.dart';

typedef NextTree = Point Function(Point tree);

class Puzzle2 {
  final String input;
  final trees = <Point, int>{};
  final visibleTrees = <Point>{};

  late List<String> rows;
  late int numberOfRows;
  late int numberOfColumns;

  Puzzle2(this.input) {
    rows = input.split('\n');
    numberOfRows = rows.length;
    numberOfColumns = rows.first.length;
  }

  int execute() {
    // map trees
    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        trees.putIfAbsent(Point(row, column),
            () => int.parse(rows[row].substring(column, column + 1)));
      }
    }

    final scenicScores = trees.keys.map(scenicScore);
    return scenicScores.reduce(max);
  }

  int scenicScore(Point point) {
    if (isSidePoint(point)) return 0;
    final treesLeft = treesVisible(
        point, trees[point]!, ((tree) => Point(tree.x - 1, tree.y)));
    final treesTop = treesVisible(
        point, trees[point]!, ((tree) => Point(tree.x, tree.y - 1)));
    final treesRight = treesVisible(
        point, trees[point]!, ((tree) => Point(tree.x + 1, tree.y)));
    final treesBottom = treesVisible(
        point, trees[point]!, ((tree) => Point(tree.x, tree.y + 1)));
    return treesTop * treesBottom * treesLeft * treesRight;
  }

  int treesVisible(
    Point tree,
    int maxHeight,
    NextTree getNextTree, [
    int previousTrees = 0,
  ]) {
    if (isSidePoint(tree)) return previousTrees;
    previousTrees = previousTrees + 1;
    final nextTree = getNextTree(tree);
    final nextHeight = trees[nextTree]!;

    // blocked
    if (nextHeight >= maxHeight) {
      return previousTrees;
    }

    // visible
    return treesVisible(
      nextTree,
      maxHeight,
      getNextTree,
      previousTrees,
    );
  }

  bool isSidePoint(Point point) =>
      point.x == 0 ||
      point.y == 0 ||
      point.x == numberOfRows - 1 ||
      point.y == numberOfColumns - 1;
}
