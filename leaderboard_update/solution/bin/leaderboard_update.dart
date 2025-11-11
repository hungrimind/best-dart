void main() {
  // Initialize the leaderboard with top scores (sorted from highest to lowest)
  List<int> scores = [1200, 1150, 1020, 950, 880];

  // Task 1: Print the top score (first element)
  print(scores[0]);

  // Task 2: Update the lowest score (last element) to 915
  scores[scores.length - 1] = 915;

  // Task 3: Print the entire updated leaderboard
  print(scores);
}

