// Declare an integer variable named 'userAge' and set its value to 25.

// Declare a double variable named 'productPrice' and set its value to 19.95.

// ------------------- DO NOT MODIFY -------------------
// The tests below will run against your code to check for correctness.
void main() {
  group('Number Types Tests', () {
    test('Variable \'userAge\' should be an integer', () {
      expect(userAge is int, true,
          reason:
              'The \'userAge\' variable represents a whole number (25), so it should be declared using the `int` type.');
    });

    test('Variable \'userAge\' should have the value 25', () {
      expect(userAge, 25,
          reason:
              'The challenge requires the \'userAge\' variable to be set to the value `25`.');
    });

    test('Variable \'productPrice\' should be a double', () {
      expect(productPrice is double, true,
          reason:
              'Because \'productPrice\' represents a number with a decimal (19.95), it should be declared using the `double` type.');
    });

    test('Variable \'productPrice\' should have the value 19.95', () {
      expect(productPrice, 19.95,
          reason:
              'The challenge requires the \'productPrice\' variable to be set to the value `19.95`.');
    });
  });
}

// Helper functions for testing - DO NOT MODIFY
void expect(dynamic actual, dynamic expected, {String? reason}) {
  if (actual != expected) {
    throw TestFailure(reason ?? 'Expected $expected but got $actual');
  }
}

void test(String description, Function body) {
  print('Running: $description');
  try {
    body();
    print('  ✅ PASSED');
  } on TestFailure catch (e) {
    print('  ❌ FAILED: ${e.message}');
  } catch (e) {
    print('  ❌ FAILED with error: $e');
  }
}

class TestFailure {
  final String message;
  TestFailure(this.message);
}

void group(String description, Function body) {
  print(description);
  body();
}
