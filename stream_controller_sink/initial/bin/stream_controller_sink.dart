import 'dart:async';

void main() {
  // Create a StreamController for order status updates
  final orderStatusController = StreamController<String>();

  // Set up a listener to display status updates
  orderStatusController.stream.listen((status) {
    print(status);
  });

  // TODO: Add the following status updates to the stream in order:
  // 1. "Order received"
  // 2. "Processing item"
  // 3. "Shipped"

  // Your code here: Add the status updates to the stream

  // Close the controller to release resources
  orderStatusController.close();
}

