import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('prints Hello, World!', () async {
    final result = await Process.run('dart', ['bin/hello_world.dart']);
    expect(result.stdout.trim(), equals('Hello, World!'));
  });
}
