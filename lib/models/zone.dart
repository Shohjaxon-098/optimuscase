// lib/models/zone.dart
enum ZoneType { personal, group }
enum ZoneStatus { free, premium }

class Zone {
  final String id;
  final String name;
  final ZoneType type;
  final ZoneStatus status;
  final List<String> members; // List of user IDs
  final List<Message> messages;
  final List<File> files; // List of files shared in the zone
  final String createdBy;

  Zone({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.members,
    required this.messages,
    required this.files,
    required this.createdBy,
  });
}

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final List<File> attachments;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.attachments = const [],
  });
}

class File {
  final String id;
  final String fileName;
  final String fileType; // e.g., 'image', 'video', 'pdf'
  final String fileUrl;

  File({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.fileUrl,
  });
}
