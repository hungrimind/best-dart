import 'dart:async';
import 'dart:io';
import 'package:test/test.dart';
import '../lib/student.dart' as student;

void main() {
  group('Variable assignment inside main', () {
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

    test('uses int assignment inside main and prints the variable', () {
      final source = File('lib/student.dart').readAsStringSync();

      // Find the main function body
      final mainStart = source.indexOf(RegExp(r'void\s+main\s*\(\s*\)\s*{'));
      expect(mainStart, isNot(-1), reason: 'Could not find main() function.');

      final braceIndex = source.indexOf('{', mainStart);
      expect(braceIndex, isNot(-1),
          reason: 'Could not find opening { of main().');

      // Simple brace matching to get the end of main
      int depth = 0;
      int endIndex = -1;
      for (int i = braceIndex; i < source.length; i++) {
        final ch = source[i];
        if (ch == '{') depth++;
        if (ch == '}') {
          depth--;
          if (depth == 0) {
            endIndex = i;
            break;
          }
        }
      }
      expect(endIndex, isNot(-1),
          reason: 'Could not find closing } of main().');

      final mainBody = source.substring(braceIndex + 1, endIndex);

      // Must declare and assign age as an int inside main
      final intAgeAssign = RegExp(r'\bint\s+age\s*=\s*10\s*;');
      expect(
        intAgeAssign.hasMatch(mainBody),
        isTrue,
        reason:
            'Declare age as an int and assign 10 inside main (e.g., int age = 10;).',
      );

      // Must print the variable, not a literal
      final printsAge = RegExp(r'\bprint\s*\(\s*age\s*\)\s*;');
      expect(
        printsAge.hasMatch(mainBody),
        isTrue,
        reason: 'Print the variable (print(age);), not a literal (print(10);).',
      );

      // Ensure there is exactly one print call
      final printCalls = RegExp(r'\bprint\s*\(').allMatches(mainBody).length;
      expect(
        printCalls,
        equals(1),
        reason: 'Use exactly one print statement inside main.',
      );

      // Ensure age is not declared at the top level (outside main)
      final topLevelMatches =
          RegExp(r'\bint\s+age\b').allMatches(source).toList();
      // Check all declarations are within the main body range
      for (final m in topLevelMatches) {
        expect(
          m.start > braceIndex && m.start < endIndex,
          isTrue,
          reason: 'Declare age only inside main, not at the top level.',
        );
      }

      // Avoid confusing == with assignment =
      expect(
        source.contains('=='),
        isFalse,
        reason:
            'Use the assignment operator (=), not the equality operator (==).',
      );
    });
  });
}
