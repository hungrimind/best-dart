void main() {
  int? a = null;
  // Safely access isNegative; returns null instead of crashing
  print(a?.isNegative);

  int? b = -5;
  // Regular access proceeds because b is non-null
  print(b.isNegative);

  int? c = 7;
  print(c.isNegative);
}
