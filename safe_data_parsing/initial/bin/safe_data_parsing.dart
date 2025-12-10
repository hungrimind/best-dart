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

  // TODO: Use a try block to attempt converting the string to an integer
  // TODO: If conversion succeeds, print: "User age is: [age]"
  // TODO: Add a catch block to handle errors
  // TODO: Print error message: "Error: Could not parse age. The value is not a valid number."

  // Current code will crash if ageString is not a valid number
  final age = int.parse(ageString);
  print('User age is: $age');
}
