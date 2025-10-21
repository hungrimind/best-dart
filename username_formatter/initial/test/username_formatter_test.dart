import 'package:test/test.dart';
import '../bin/username_formatter.dart';

void main() {
  group('getFormattedUsername', () {
    test('Handles a standard lowercase name', () {
      expect(getFormattedUsername('ada-lovelace'), 'ADA',
          reason:
              "Failed with the input 'ada-lovelace'. Expected 'ADA', but got a different result. Make sure you are splitting the string correctly and converting the first part to uppercase.");
    });

    test('Handles a name with mixed casing', () {
      expect(getFormattedUsername('Grace-Hopper'), 'GRACE',
          reason:
              "Failed with the input 'Grace-Hopper'. Expected 'GRACE'. Your function should correctly handle names that already have some uppercase letters.");
    });

    test('Handles a different standard name', () {
      expect(getFormattedUsername('kyle-lee'), 'KYLE',
          reason:
              "Failed with the input 'kyle-lee'. Expected 'KYLE'. Ensure your code works for different names, not just one specific case.");
    });

    test('Handles a short, single-letter name', () {
      expect(getFormattedUsername('b-abbage'), 'B',
          reason:
              "Failed with the input 'b-abbage'. Expected 'B'. This checks if your code can handle edge cases like very short first names.");
    });

    test('Handles names with numbers', () {
      expect(getFormattedUsername('r2-d2'), 'R2',
          reason:
              "Failed with the input 'r2-d2'. Expected 'R2'. The .toUpperCase() method should correctly handle strings that contain numbers.");
    });
  });
}
