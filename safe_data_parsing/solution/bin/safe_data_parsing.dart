/// Simulates fetching user data from a database.
/// Sometimes returns a valid number string, sometimes an invalid one.
String fetchUserData() {
  // Simulate different scenarios
  final scenarios = ['25', 'thirty', '42', 'not a number', '18'];
  return scenarios[DateTime.now().millisecond % scenarios.length];
}

void main() {
  // Fetch the user's age as a String
  final ageString = fetchUserData();

  try {
    // Attempt to convert the string to an integer
    final age = int.parse(ageString);
    print('User age is: $age');
  } catch (e) {
    // Handle the error if the string is not a valid number
    print('Error: Could not parse age. The value is not a valid number.');
  }
}
