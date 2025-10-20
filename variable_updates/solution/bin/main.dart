// main.dart
void main() {
  // 1. A wizard buys 3 healing potions.
  //    Declare a variable named `potionCount` and set its value to 3.
  //    This is your first "box".
  var potionCount = 3;

  // 2. Each potion costs 5 gold coins.
  //    Declare a variable named `goldPerPotion` and set its value to 5.
  //    This is your second "box".
  var goldPerPotion = 5;

  // 3. Calculate the initial cost.
  //    Declare a variable named `totalCost`.
  //    Calculate the result of `potionCount` multiplied by `goldPerPotion` and store it in the `totalCost` box.
  var totalCost = potionCount * goldPerPotion;
  print('Initial cost: $totalCost');

  // 4. The wizard liked the potions and bought 2 more!
  //    Update the value in the `potionCount` box by adding 2 to its current value.
  potionCount = potionCount + 2;

  // 5. Recalculate the new total cost.
  //    Update the `totalCost` box with the new total based on the updated potion count.
  totalCost = potionCount * goldPerPotion;
  print('Final cost: $totalCost');
}
