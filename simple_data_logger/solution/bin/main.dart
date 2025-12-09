// main.dart

import 'dart:async';

void main() {
  // Create a stream controller to simulate a data source
  final controller = StreamController<int>();
  final dataStream = controller.stream;

  // Listen to the stream and handle all three event types
  dataStream.listen(
    // Handle data events
    (value) {
      print('Data received: $value');
    },
    // Handle errors
    onError: (error) {
      print('Error occurred.');
    },
    // Handle completion
    onDone: () {
      print('Stream is now closed.');
    },
  );

  // Simulate stream events: emit some data, then an error, then close
  controller.add(42);
  controller.add(100);
  controller.addError('Test error');
  controller.add(200);
  controller.close();
}
