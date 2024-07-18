// lib/widget/post_card.dart
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(post.userAvatar),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(post.content),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Icon(Icons.thumb_up, size: 16),
                      SizedBox(width: 5),
                      Text('${post.likes} likes'),
                      SizedBox(width: 10),
                      Icon(Icons.comment, size: 16),
                      SizedBox(width: 5),
                      Text('${post.comments} comments'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
