// Base Report class with generic report generation
class Report {
  void generate() {
    print('Generating report header and footer.');
  }
}

// SalesReport extends Report and adds sales-specific content
class SalesReport extends Report {
  @override
  void generate() {
    super.generate();
    print('Adding sales data and charts.');
  }
}

void main() {
  final report = SalesReport();
  report.generate();
}


