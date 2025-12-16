class Player {
  String username = 'Guest';
  int health = 100;
  double score = 0.0;
}

void main() {
  // Create two player instances
  Player player1 = Player();
  Player player2 = Player();

  // Modify player1's properties
  player1.username = 'Alex';
  player1.health = 85;
  player1.score = 1500.5;

  // Print player1's information
  print('Player 1:');
  print('Username: ${player1.username}');
  print('Health: ${player1.health}');
  print('Score: ${player1.score}');

  // Print player2's information
  print('\nPlayer 2:');
  print('Username: ${player2.username}');
  print('Health: ${player2.health}');
  print('Score: ${player2.score}');
}


