// Base Duck class
class Duck {
  String name;

  Duck(this.name);

  void swim() {
    print('$name is swimming in the pond.');
  }
}

// CanFly mixin
mixin CanFly {
  void fly() {
    print('Swoosh! I\'m flying!');
  }
}

// SuperDuck class that extends Duck and uses CanFly mixin
class SuperDuck extends Duck with CanFly {
  SuperDuck(String name) : super(name);
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
