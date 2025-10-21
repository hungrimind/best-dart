String getFormattedUsername(String fullName) {
  // Split the string by the hyphen to get a list of names.
  final names = fullName.split('-');

  // Get the first item from the list (the first name).
  final firstName = names[0];

  // Convert the first name to uppercase and return it.
  return firstName.toUpperCase();
}

void main() {
  // Example usage
  print(getFormattedUsername('ada-lovelace'));
  print(getFormattedUsername('Grace-Hopper'));
  print(getFormattedUsername('kyle-lee'));
}
