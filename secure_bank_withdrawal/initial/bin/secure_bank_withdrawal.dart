class BankAccount {
  double balance;

  BankAccount(this.balance);

  void withdraw(double amount) {
    // TODO: Check if the withdrawal amount is valid (positive number)
    // TODO: If the amount is negative, throw an exception with message "Withdrawal amount must be positive."
    // TODO: If the amount is valid, subtract it from the balance
    balance -= amount;
  }
}

void main() {
  // Test valid withdrawal
  try {
    final account1 = BankAccount(1000.0);
    account1.withdraw(250.0);
    print('Withdrawal successful. New balance: \$${account1.balance.toStringAsFixed(2)}');
  } catch (e) {
    print('Error: ${e.toString()}');
  }

  // Test invalid withdrawal (negative amount)
  try {
    final account2 = BankAccount(1000.0);
    account2.withdraw(-100.0);
    print('Withdrawal successful. New balance: \$${account2.balance.toStringAsFixed(2)}');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}

