// lib/screens/create_post_screen.dart
import 'package:flutter/material.dart';
import '../models/post_type.dart'; // Import the PostType enum

class CreatePostScreen extends StatelessWidget {
  final PostType postType;

  CreatePostScreen({required this.postType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${postTypeToString(postType)}'),
      ),
      body: Center(
        child: Text('Create a ${postTypeToString(postType)}'),
      ),
    );
  }

  String postTypeToString(PostType type) {
    switch (type) {
      case PostType.post:
        return 'Post';
      case PostType.article:
        return 'Article';
      case PostType.vacancy:
        return 'Vacancy';
      case PostType.competition: // o'zgartirilgan nom
        return 'Competition'; // o'zgartirilgan nom
      default:
        return '';
    }
  }
}
