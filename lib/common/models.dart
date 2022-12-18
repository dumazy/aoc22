import 'dart:math';

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

  Point get left => Point(x - 1, y);
  Point get topLeft => Point(x - 1, y - 1);
  Point get top => Point(x, y - 1);
  Point get topRight => Point(x + 1, y - 1);
  Point get right => Point(x + 1, y);
  Point get bottomRight => Point(x + 1, y + 1);
  Point get bottom => Point(x, y + 1);
  Point get bottomLeft => Point(x - 1, y + 1);

  List<Point> get adjacentPoints => [
        left,
        // topLeft,
        top,
        // topRight,
        right,
        // bottomRight,
        bottom,
        // bottomLeft,
      ].toList();
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

const az = 'abcdefghijklmnopqrstuvwxyz';

typedef ValueMapper<T> = T Function(String);

class Matrix<T> {
  final Map<Point, T> data;

  Matrix(this.data);

  factory Matrix.fromInput(String input, [ValueMapper<T>? mapper]) {
    final rows = input.split('\n');
    final numberOfRows = rows.length;
    final numberOfColumns = rows.first.length;

    final data = <Point, T>{};
    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        final value = rows[row].substring(column, column + 1);
        data.putIfAbsent(Point(column, row), () {
          return mapper?.call(value) ?? value as T;
        });
      }
    }
    return Matrix(data);
  }

  int get width => data.keys.map((e) => e.x).reduce(max) + 1;
  int get height => data.keys.map((e) => e.y).reduce(max) + 1;

  @override
  String toString() {
    final symbols = List.generate(
      height,
      (y) => List.generate(
        width,
        (x) {
          final point = Point(x, y);
          return data[point];
        },
      ).join(''),
    );
    return symbols.join('\n');
  }
}

typedef StringMatrix = Matrix<String>;
