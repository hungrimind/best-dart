// Base class Document
class Document {
  void save() {
    print('Saving the document to a file...');
  }
}

// Subclass Receipt that extends Document
class Receipt extends Document {
  // TODO: Override the save() method here
  // The new implementation should print: "Saving the receipt to the accounting system..."
  // Remember to use the @override annotation
}

void main() {
  // Demonstrate the override behavior
  final document = Document();
  final receipt = Receipt();

  print('Calling save() on Document:');
  document.save();

  print('\nCalling save() on Receipt:');
  receipt.save();
}

