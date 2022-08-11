import 'package:flutter_test/flutter_test.dart';

void main() {
  test("${DateTime.now()}: the most simple test", (() {
    Shape circle = Shape(ShapeType.circle);
    Shape square = Shape(ShapeType.square);
    expect("Circle", circle.draw());
    expect("Square", square.draw());
  }));
}

enum ShapeType { circle, square }

abstract class Shape {
  factory Shape(ShapeType type) {
    switch (type) {
      case ShapeType.circle:
        return Circle();
      case ShapeType.square:
        return Square();
    }
  }

  String draw();
}

class Circle implements Shape {
  @override
  String draw() {
    return 'Circle';
  }
}

class Square implements Shape {
  @override
  String draw() {
    return 'Square';
  }
}
