// Provided functions - you don't need to write these, only use them
String getCityName() {
  return 'New York';
}

int getTemperature() {
  return 72;
}

void main() {
  // Call getCityName() and store the result in a variable
  final city = getCityName();
  
  // Call getTemperature() and store the result in a variable
  final temperature = getTemperature();
  
  // Create a personalized weather report using the stored values
  final report = 'The temperature in $city is $temperature degrees.';
  
  // Print the weather report
  print(report);
}





