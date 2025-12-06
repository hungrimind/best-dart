class Rectangle {
  int _width = 0;
  int _height = 0;

  // Width getter
  int get width => _width;

  // Width setter with validation
  set width(int value) {
    if (value > 0) {
      _width = value;
    }
  }

  // Height getter
  int get height => _height;

  // Height setter with validation
  set height(int value) {
    if (value > 0) {
      _height = value;
    }
  }

  // Area getter that calculates the area
  int get area => _width * _height;
}

void main() {
  final rectangle = Rectangle();

  // Test setting valid width and height
  rectangle.width = 5;
  rectangle.height = 10;
  print("Width: ${rectangle.width}");
  print("Height: ${rectangle.height}");
  print("Area: ${rectangle.area}");

  // Test that invalid values are rejected
  rectangle.width = -5;
  rectangle.height = 0;
  print("\nAfter trying to set invalid values:");
  print("Width: ${rectangle.width}");
  print("Height: ${rectangle.height}");
  print("Area: ${rectangle.area}");
}
