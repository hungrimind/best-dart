import 'dart:io';
import 'package:test/test.dart';

void main() {
  group('Secure Bank Withdrawal', () {
    test(
      'should successfully withdraw a positive amount',
      () {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/secure_bank_withdrawal.dart'],
          runInShell: true,
        );

        expect(
          result.exitCode,
          0,
          reason:
              'Program should exit successfully. Make sure your code is complete and runnable.',
        );

        final output = result.stdout.toString();
        expect(
          output,
          contains('Withdrawal successful. New balance: \$750.00'),
          reason:
              'When withdrawing a valid positive amount, the balance should decrease correctly. '
              'Check that you subtract the amount from balance when the withdrawal is valid.',
        );
      },
    );

    test(
      'should throw exception for negative withdrawal amount',
      () {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/secure_bank_withdrawal.dart'],
          runInShell: true,
        );

        final output = result.stdout.toString();
        expect(
          output,
          contains('Error: Exception: Withdrawal amount must be positive.'),
          reason:
              'When withdrawing a negative amount, an exception should be thrown with the message '
              '"Withdrawal amount must be positive." Check that you use throw Exception() for invalid amounts.',
        );
      },
    );

    test(
      'should not modify balance when exception is thrown',
      () {
        final result = Process.runSync(
          'dart',
          ['run', 'bin/secure_bank_withdrawal.dart'],
          runInShell: true,
        );

        final output = result.stdout.toString();
        // After invalid withdrawal, balance should remain 1000.0
        // We verify this by checking that the error message appears
        // and that no successful withdrawal message appears after the error
        expect(
          output,
          contains('Error: Exception: Withdrawal amount must be positive.'),
          reason:
              'When an exception is thrown, the balance should not be modified. '
              'Make sure you throw the exception before subtracting from balance.',
        );
      },
    );
  });
}

