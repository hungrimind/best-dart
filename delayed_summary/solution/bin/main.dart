// main.dart

void main() {
  // By using 'late', you promise Dart that 'summary' will be given a value
  // before it is used by the print() function.
  late String summary;

  // Other variables are defined and initialized first.
  String userName = "Tadas";
  int userAge = 28;

  // Now that you have the required information, you can build the summary string.
  summary = "$userName is $userAge years old.";

  // The promise is fulfilled, so this is safe.
  print(summary);
}
