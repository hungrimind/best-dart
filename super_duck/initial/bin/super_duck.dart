// Base Duck class
class Duck {
  String name;

  Duck(this.name);

  void swim() {
    print('$name is swimming in the pond.');
  }
}

// TODO: Create a mixin named CanFly
// The mixin should provide a method that prints: "Swoosh! I'm flying!"

// TODO: Create a class named SuperDuck that extends Duck
// SuperDuck should use the CanFly mixin to gain flying ability
// Remember to use the 'with' keyword to apply the mixin
class SuperDuck extends Duck {
  SuperDuck(String name) : super(name);

  void fly() {
    throw UnimplementedError();
  }
}

void main() {
  // Create a regular duck
  final regularDuck = Duck('Donald');
  print('Regular Duck:');
  regularDuck.swim();

  // Create a super duck
  final superDuck = SuperDuck('Super Donald');
  print('\nSuper Duck:');
  superDuck.swim();
  superDuck.fly();
}
