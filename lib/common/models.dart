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
}
