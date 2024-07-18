// lib/models/chat.dart
enum ChatStatus { free, premium }

class Chat {
  final String id;
  final String name; // Chat group name or participant names
  final List<String> participants; // List of user IDs participating in the chat
  final List<Message> messages;
  final ChatStatus status;
  final String createdBy;

  Chat({
    required this.id,
    required this.name,
    required this.participants,
    required this.messages,
    required this.status,
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
