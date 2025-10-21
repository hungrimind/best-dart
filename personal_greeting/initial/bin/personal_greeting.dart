// TODO: Complete this function
String createGreeting(String name, int visits) {
  // Combine the name and visits into the required greeting string.
  // Example: "Hello Alice, this is your 10th visit!"
  return "";
}

// ------------------- DO NOT MODIFY -------------------
// The tests below will run against your code to check for correctness.
void main() {
  group('Greeting Tests', () {
    test('should create the correct greeting for a new user', () {
      final actual = createGreeting("Bob", 1);
      final expected = "Hello Bob, this is your 1th visit!";
      expect(actual, expected, reason: 'Failed with name: "Bob" and visits: 1');
    });

    test('should create the correct greeting for a returning user', () {
      final actual = createGreeting("Sandra", 25);
      final expected = "Hello Sandra, this is your 25th visit!";
      expect(actual, expected,
          reason: 'Failed with name: "Sandra" and visits: 25');
    });

    test('should include the correct prefix "Hello "', () {
      final greeting = createGreeting("Test", 5);
      expect(greeting.startsWith("Hello "), true,
          reason: 'The greeting should start with "Hello " (with a space).');
    });

    test('should include the correct suffix "th visit!"', () {
      final greeting = createGreeting("Test", 10);
      expect(greeting.endsWith("th visit!"), true,
          reason: 'The greeting should end with "th visit!"');
    });

    test('should have correct spacing around the name and number', () {
      final greeting = createGreeting("Maria", 99);
      final hasSpaceAfterHello = greeting.contains("Hello Maria");
      final hasSpaceBeforeThis = greeting.contains("Maria, this");
      final hasSpaceAfterIsYour = greeting.contains("is your 99");
      final hasSpaceBeforeTh = greeting.contains("99th visit!");

      expect(
          hasSpaceAfterHello &&
              hasSpaceBeforeThis &&
              hasSpaceAfterIsYour &&
              hasSpaceBeforeTh,
          true,
          reason:
              'Check your spacing. It should look like: "Hello [Name], this is your [Number]th visit!"');
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
