// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widget/post_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        postId: '1',
        userId: 'user1',
        userName: 'John Doe',
        userAvatar:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2Ffluttercommunity%2Fflutter_launcher_icons%2Fissues%2F96&psig=AOvVaw2BJI8kgIY8CTjOomkfigAb&ust=1721382778491000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJiF7tmosIcDFQAAAAAdAAAAABAE',
        content: 'This is a sample post.',
        timestamp: '2024-07-16',
        likes: 15,
        comments: 5,
      ),
      Post(
        postId: '2',
        userId: 'user2',
        userName: 'Jane Smith',
        userAvatar:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2Ffluttercommunity%2Fflutter_launcher_icons%2Fissues%2F96&psig=AOvVaw2BJI8kgIY8CTjOomkfigAb&ust=1721382778491000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJiF7tmosIcDFQAAAAAdAAAAABAE',
        content: 'Another sample post with more content.',
        timestamp: '2024-07-15',
        likes: 22,
        comments: 8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: Icon(
                Icons.notifications,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
    );
  }
}
