import 'dart:async';

void main() {
  // Create a StreamController for order status updates
  final orderStatusController = StreamController<String>();

  // Set up a listener to display status updates
  orderStatusController.stream.listen((status) {
    print(status);
  });

  // Add status updates to the stream
  orderStatusController.add('Order received');
  orderStatusController.add('Processing item');
  orderStatusController.add('Shipped');

  // Close the controller to release resources
  orderStatusController.close();
}

