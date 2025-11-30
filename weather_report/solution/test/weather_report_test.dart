import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('calls getCityName() and stores the result', () async {
    final result = await Process.run('dart', ['bin/weather_report.dart']);
    expect(
      result.stdout.toString(),
      contains('New York'),
      reason: 'The output should include the city name returned by getCityName(). Make sure you call getCityName() and store its result in a variable.',
    );
  });

  test('calls getTemperature() and stores the result', () async {
    final result = await Process.run('dart', ['bin/weather_report.dart']);
    expect(
      result.stdout.toString(),
      contains('72'),
      reason: 'The output should include the temperature returned by getTemperature(). Make sure you call getTemperature() and store its result in a variable.',
    );
  });

  test('creates and prints a complete weather report', () async {
    final result = await Process.run('dart', ['bin/weather_report.dart']);
    final output = result.stdout.toString();
    expect(
      output,
      contains('The temperature in'),
      reason: 'The output should start with "The temperature in" to create a complete sentence.',
    );
    expect(
      output,
      contains('degrees.'),
      reason: 'The output should end with "degrees." to complete the weather report sentence.',
    );
  });
}





