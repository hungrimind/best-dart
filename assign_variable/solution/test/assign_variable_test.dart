import 'dart:async';
import 'package:test/test.dart';
import '../bin/assign_variable.dart' as student;

void main() {
  test('main should print exactly 10 to the console', () {
    final prints = <String>[];

    runZoned(
      () => student.main(),
      zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, line) {
          prints.add(line);
        },
      ),
    );

    expect(
      prints.length,
      equals(1),
      reason: 'Print only one line.',
    );

    expect(
      prints.first,
      equals('10'),
      reason: 'Print the value of age, which should be 10.',
    );
  });
}
