// lib/models/notification.dart
enum NotificationType { post, vacancy, other }

class NotificationMod {
  final String id;
  final NotificationType type;
  final String title;
  final String description;
  final DateTime timestamp;
  final bool isPremium;

  NotificationMod({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.isPremium,
  });
}
