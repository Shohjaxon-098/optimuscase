// lib/models/case.dart
enum CaseType { challenge, recruitment, other }
enum CaseStatus { open, closed, upcoming }

class Case {
  final String id;
  final String title;
  final String description;
  final CaseType type;
  final DateTime startDate;
  final DateTime endDate;
  final CaseStatus status;
  final String companyId;
  final List<String> requirements;
  final String location;

  Case({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.companyId,
    required this.requirements,
    required this.location,
  });
}
