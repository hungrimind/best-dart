// This function simulates fetching data from a server.
// After a 2-second delay, it completes with the welcome message.
Future<String> fetchWelcomeMessage() async {
  print("Wait 2 seconds...");
  await Future.delayed(Duration(seconds: 2));
  return "Welcome to our app!";
}

// TODO: Create an async function named printWelcomeMessage that:
// 1. Waits for the welcome message to be fetched
// 2. Prints the message to the console
void printWelcomeMessage() {
  // TODO: Implement this function
}

void main() {
  printWelcomeMessage();
}
