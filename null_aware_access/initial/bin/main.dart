void main() {
  int? a = null;
  // TODO: Safely access isNegative on a possibly-null int using ?.
  print(a.isNegative); // should print null safely

  int? b = -5;
  print(b.isNegative); // should print true

  int? c = 7;
  print(c.isNegative); // should print false
}
