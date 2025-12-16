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
    // TODO: Call the parent Report's generate method to include header and footer
    // TODO: Add sales-specific content by printing "Adding sales data and charts."
  }
}

void main() {
  final report = SalesReport();
  report.generate();
}



