import 'package:aoc22/common/models.dart';

class Puzzle {
  final String input;

  final visitedPoints = <Point>{};

  Puzzle(this.input);

  int execute() {
    final commands = input.split('\n');
    var knots = List.generate(10, (index) => Point(0, 0));
    visitedPoints.add(knots.last);

    for (String command in commands) {
      final parts = command.split(' ');
      final direction = parts.first;
      final steps = int.parse(parts.last);

      for (var i = 0; i < steps; i++) {
        switch (direction) {
          case 'R':
            knots.first = knots.first.moveRight();
            break;
          case 'L':
            knots.first = knots.first.moveLeft();
            break;
          case 'U':
            knots.first = knots.first.moveUp();
            break;
          case 'D':
            knots.first = knots.first.moveDown();
            break;
        }
        for (var i = 1; i < knots.length; i++) {
          knots[i] = keepUp(knots[i - 1], knots[i]);
        }
        visitedPoints.add(knots.last);
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
