// lib/screens/select_post_type_screen.dart
import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import '../models/post_type.dart'; // Import the PostType enum

class SelectPostTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Post Type'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          PostTypeOption(
            title: 'Post',
            onTap: () => _navigateToCreatePost(context, PostType.post),
          ),
          PostTypeOption(
            title: 'Article',
            onTap: () => _navigateToCreatePost(context, PostType.article),
          ),
          PostTypeOption(
            title: 'Vacancy',
            onTap: () => _navigateToCreatePost(context, PostType.vacancy),
          ),
          PostTypeOption(
            title: 'Competition', // o'zgartirilgan nom
            onTap: () => _navigateToCreatePost(context, PostType.competition), // o'zgartirilgan nom
          ),
        ],
      ),
    );
  }

  void _navigateToCreatePost(BuildContext context, PostType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePostScreen(postType: type),
      ),
    );
  }
}

class PostTypeOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  PostTypeOption({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
