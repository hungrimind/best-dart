import 'dart:async';
import 'dart:io';
import 'hello.dart' as hello;

void main() {
  final expected = Directory.current.path;
  final actual = hello.getCurrentDirectory();
  if (actual != expected) {
    stderr.writeln('Expected: ' + expected + '\nActual:   ' + actual);
    exit(1);
  }
  print('Test passed.');

  // Because of this, I can remove the extra function call, and just use the main function directly.
  final captured = _capturePrint(() {
    hello.main();
  }).trim();

  if (captured != expected) {
    stderr.writeln('main() output mismatch.\nExpected: ' +
        expected +
        '\nActual:   ' +
        captured);
    exit(1);
  }
  print('Main test passed.');
}

String _capturePrint(void Function() body) {
  final buffer = StringBuffer();
  runZoned(
    body,
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        buffer.writeln(line);
      },
    ),
  );
  return buffer.toString();
}
