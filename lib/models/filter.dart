// lib/models/filter.dart
class Filter {
  final String? keyword;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> categories;

  Filter({
    this.keyword,
    this.startDate,
    this.endDate,
    this.categories = const [],
  });
}
