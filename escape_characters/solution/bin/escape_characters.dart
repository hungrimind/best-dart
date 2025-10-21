// Return the required string from this function
String trickyString() {
  // We start with single quotes.
  // The double quote can be used directly.
  // The single quote in "That's" must be escaped: \'
  // The backslash must be escaped: \\
  return 'She said: "That\'s a backslash: \\"';

  // An alternative solution using double quotes:
  // return "She said: \"That's a backslash: \\\"";
}

void main() {
  print(trickyString());
}
