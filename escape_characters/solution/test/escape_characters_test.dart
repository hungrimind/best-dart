import 'package:test/test.dart';

// Import the student's trickyString function
import '../bin/escape_characters.dart' as student;

void main() {
  const expectedString = 'She said: "That\'s a backslash: \\"';

  test('test_returnsCorrectString', () {
    expect(student.trickyString(), equals(expectedString),
        reason:
            "The returned string does not exactly match the required output. Check your quotes, backslashes, and spacing.");
  });

  test('test_stringIsNotEmpty', () {
    expect(student.trickyString().isNotEmpty, isTrue,
        reason:
            "The function returned an empty string. You need to return the required text.");
  });

  test('test_includesEscapedSingleQuote', () {
    // We check for the presence of the apostrophe.
    expect(student.trickyString().contains("That's"), isTrue,
        reason:
            "Your string seems to be missing the single quote (apostrophe) in the word \"That's\".");
  });

  test('test_includesDoubleQuote', () {
    // We check for the presence of the double quote character.
    expect(student.trickyString().contains('"'), isTrue,
        reason:
            "Your string is missing the double quote character (\"). Remember to include it as part of the text.");
  });

  test('test_includesBackslash', () {
    // We check for the presence of the backslash character.
    expect(student.trickyString().contains('\\'), isTrue,
        reason:
            "Your string is missing the backslash character (\\). Remember, to include one backslash, you need to type two (`\\\\`).");
  });
}
