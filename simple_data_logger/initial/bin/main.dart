// main.dart

import 'dart:async';

void main() {
  // Create a stream controller to simulate a data source
  final controller = StreamController<int>();
  final dataStream = controller.stream;

  // TODO: Listen to the dataStream and handle all three event types:
  // 1. Handle data events: print "Data received: [value]" for each integer value
  // 2. Handle errors: print "Error occurred." if the stream emits an error
  // 3. Handle completion: print "Stream is now closed." when the stream closes

  // Simulate stream events: emit some data, then an error, then close
  controller.add(42);
  controller.add(100);
  controller.addError('Test error');
  controller.add(200);
  controller.close();
}
