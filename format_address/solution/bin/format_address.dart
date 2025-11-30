void formatAddress(
  String street, {
  required String city,
  required String postalCode,
}) {
  print('$street, $city, $postalCode');
}

void main() {
  formatAddress('123 Main St', city: 'Anytown', postalCode: '12345');
}
