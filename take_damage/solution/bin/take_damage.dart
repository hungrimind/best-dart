class Player {
  String name = "Gandalf";
  int health = 100;

  void takeDamage(int damageAmount) {
    health -= damageAmount;
  }
}

void main() {
  final player = Player();

  print("Player: ${player.name}");
  print("Initial health: ${player.health}");

  player.takeDamage(25);
  print("Health after taking 25 damage: ${player.health}");

  player.takeDamage(10);
  print("Health after taking 10 more damage: ${player.health}");
}
