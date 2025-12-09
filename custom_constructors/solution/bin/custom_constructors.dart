class Book {
  String title;
  String author;
  int publicationYear;

  Book(this.title, this.author, this.publicationYear);
}

void main() {
  final book = Book("The Dart Guide", "John Doe", 2023);

  print("Title: ${book.title}");
  print("Author: ${book.author}");
  print("Publication Year: ${book.publicationYear}");
}
