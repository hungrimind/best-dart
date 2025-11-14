void main() {
  // Provided: bakery inventory map
  final bakeryInventory = <String, int>{
    'croissant': 12,
    'muffin': 20,
    'baguette': 8,
  };

  // 1. New Delivery: Add 30 cookies
  bakeryInventory['cookie'] = 30;

  // 2. A Big Sale: Customer bought 5 croissants
  bakeryInventory['croissant'] = bakeryInventory['croissant']! - 5;

  // 3. Discontinued Item: Remove baguette
  bakeryInventory.remove('baguette');

  // 4. Final Check: Print the final inventory
  print(bakeryInventory);
}
