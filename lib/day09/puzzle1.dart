import 'package:aoc22/common/models.dart';

class Puzzle {
  final String input;

  final visitedPoints = <Point>{};

  Puzzle(this.input);

  int execute() {
    final commands = input.split('\n');
    var currentPointHead = Point(0, 0);
    var currentPointTail = currentPointHead;
    visitedPoints.add(currentPointTail);

    var previousPointHead = currentPointHead;
    var previousPointTail = currentPointTail;

    for (String command in commands) {
      final parts = command.split(' ');
      final direction = parts.first;
      final steps = int.parse(parts.last);

      for (var i = 0; i < steps; i++) {
        switch (direction) {
          case 'R':
            currentPointHead = currentPointHead.moveRight();
            break;
          case 'L':
            currentPointHead = currentPointHead.moveLeft();
            break;
          case 'U':
            currentPointHead = currentPointHead.moveUp();
            break;
          case 'D':
            currentPointHead = currentPointHead.moveDown();
            break;
        }
        currentPointTail = keepUp(currentPointHead, currentPointTail);
        visitedPoints.add(currentPointTail);
      }
    }

    return visitedPoints.length;
  }

  Point keepUp(Point leader, Point follower) {
    final distance = leader - follower;
    // touching, stay in place
    if (distance.x.abs() <= 1 && distance.y.abs() <= 1) return follower;

    if (distance.y == 0) {
      return distance.x.isNegative ? follower.moveLeft() : follower.moveRight();
    }

    if (distance.x == 0) {
      return distance.y.isNegative ? follower.moveUp() : follower.moveDown();
    }

    if (distance.y.isNegative) {
      // move up
      if (distance.x.isNegative) {
        // move left
        return follower.moveUp().moveLeft();
      } else {
        // move right
        return follower.moveUp().moveRight();
      }
    } else {
      // move down
      if (distance.x.isNegative) {
        // move left
        return follower.moveDown().moveLeft();
      } else {
        // move right
        return follower.moveDown().moveRight();
      }
    }
  }
}
