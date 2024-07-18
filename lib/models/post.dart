// lib/models/post.dart
class Post {
  final String postId;
  final String userId;
  final String userName;
  final String userAvatar;
  final String content;
  final String timestamp;
  final int likes;
  final int comments;

  Post({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });
}
