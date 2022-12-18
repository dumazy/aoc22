import 'package:aoc22/common/models.dart';

import '../common/dijkstra.dart';

class Puzzle {
  final String input;

  Puzzle(this.input);

  int execute() {
    final matrix = StringMatrix.fromInput(input);
    final start =
        matrix.data.entries.firstWhere((entry) => entry.value == "S").key;
    final end =
        matrix.data.entries.firstWhere((entry) => entry.value == "E").key;

    print(matrix);

    final Map<Point, Map<Point, int>> graph =
        matrix.data.map((Point point, String currentValue) {
      final int height = az.indexOf(currentValue);
      final directions = <Point, int>{};
      for (var adjacentPoint in point.adjacentPoints) {
        if (currentValue == "S") {
          directions.putIfAbsent(adjacentPoint, () => 1);
          continue;
        }
        if (adjacentPoint == end) {
          int difference = az.indexOf('z') - height;
          if (difference < 2) {
            print("from $currentValue to end");
            directions.putIfAbsent(adjacentPoint, () => 1);
          }
          continue;
        }
        if (!matrix.data.containsKey(adjacentPoint)) continue;
        final adjacentValue = matrix.data[adjacentPoint]!;
        int otherHeight = az.indexOf(adjacentValue);
        int difference = otherHeight - height;
        if (difference < 2) {
          print("from $currentValue to $adjacentValue");
          directions.putIfAbsent(adjacentPoint, () => 1);
        }
      }
      return MapEntry(point, directions);
    });

    final result = Dijkstra.findPathFromGraph(graph, start, end);
    printResult(matrix, result, start, end);
    return result.length - 1;
  }

  void printResult(
    StringMatrix matrix,
    List<dynamic> result,
    Point start,
    Point end,
  ) {
    for (final entry in result.asMap().entries) {
      if (entry.key == 0) continue;
      final previous = result[entry.key - 1];
      print(
          "Result: from ${matrix.data[previous]} to ${matrix.data[entry.value]}");
    }

    final symbols = List.generate(
      matrix.height,
      (y) => List.generate(
        matrix.width,
        (x) {
          final point = Point(x, y);
          if (start == point) return "S";
          if (end == point) return "E";
          if (result.contains(point)) return "#";
          return ".";
        },
      ).join(''),
    );
    print(symbols.join('\n'));
  }

  // List<Point>? getShortestPath(
  //   StringMatrix matrix,
  //   List<Point> visited,
  //   Point goal,
  // ) {
  //   final current = visited.last;
  //   final currentValue = matrix.data[current]!;
  //   print("Visiting $current with value $currentValue");
  //   final int height = az.indexOf(currentValue);
  //   List<List<Point>?> paths = [];
  //   for (var adjacentPoint in current.adjacentPoints) {
  //     if (adjacentPoint == goal) {
  //       return visited + [goal];
  //     }

  //     if (visited.contains(adjacentPoint)) continue;
  //     if (!matrix.data.containsKey(adjacentPoint)) continue;
  //     int otherHeight = az.indexOf(matrix.data[adjacentPoint]!);
  //     if (otherHeight - height > 1) continue;

  //     paths.add(getShortestPath(matrix, visited + [adjacentPoint], goal));
  //   }

  //   final validPaths = paths.whereType<List<Point>>().toList();
  //   validPaths.sort((a, b) => a.length - b.length);
  //   if (validPaths.isEmpty) return null;
  //   return validPaths.first;
  // }
}
