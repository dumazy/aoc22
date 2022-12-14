import 'package:equatable/equatable.dart';

class Point extends Equatable {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  List<Object?> get props => [
        x,
        y,
      ];

  @override
  bool? get stringify => true;

  Point moveLeft() => Point(x - 1, y);
  Point moveRight() => Point(x + 1, y);
  Point moveUp() => Point(x, y - 1);
  Point moveDown() => Point(x, y + 1);

  Distance operator -(Point other) {
    return Distance(x - other.x, y - other.y);
  }
}

class Distance extends Equatable {
  final int x;
  final int y;

  Distance(this.x, this.y);

  @override
  List<Object?> get props => [
        x,
        y,
      ];

  @override
  bool? get stringify => true;
}
