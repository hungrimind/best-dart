// This function simulates fetching data from a server.
// After a 2-second delay, it completes with the welcome message.
Future<String> fetchWelcomeMessage() async {
  print("Wait 2 seconds...");
  await Future.delayed(Duration(seconds: 2));
  return "Welcome to our app!";
}

// Your task: Create an async function that fetches and prints the welcome message.
Future<void> printWelcomeMessage() async {
  String message = await fetchWelcomeMessage();
  print(message);
}

void main() {
  printWelcomeMessage();
}
