class Rectangle {
  int _width = 0;
  int _height = 0;

  // TODO: Create a width getter that returns _width

  // TODO: Create a width setter that validates the value is greater than 0
  // If the value is valid, update _width. Otherwise, leave _width unchanged.

  // TODO: Create a height getter that returns _height

  // TODO: Create a height setter that validates the value is greater than 0
  // If the value is valid, update _height. Otherwise, leave _height unchanged.

  // TODO: Create an area getter that calculates and returns _width * _height
  // Do not create a private _area property - calculate it each time.
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

