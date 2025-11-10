void main(List<String> args) {
  // The dayOfWeek variable is provided for you
  String dayOfWeek = args.isNotEmpty ? args[0] : 'Monday';

  // Use a switch statement to determine if it's a weekday or weekend
  switch (dayOfWeek) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('It\'s a weekday.');
      break;
    case 'Saturday':
    case 'Sunday':
      print('It\'s the weekend!');
      break;
    default:
      print('Invalid day.');
  }
}

