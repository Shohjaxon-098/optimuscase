// lib/screens/post_list_screen.dart
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widget/post_card.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final List<Post> _posts = [
    Post(
      postId: '1',
      userId: 'user1',
      userName: 'John Doe',
      userAvatar: 'https://example.com/avatar1.jpg',
      content: 'This is a sample post.',
      timestamp: '2024-07-16',
      likes: 15,
      comments: 5,
    ),
    Post(
      postId: '2',
      userId: 'user2',
      userName: 'Jane Smith',
      userAvatar: 'https://example.com/avatar2.jpg',
      content: 'Another sample post with more content.',
      timestamp: '2024-07-15',
      likes: 22,
      comments: 8,
    ),
  ];

  List<Post> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    _filteredPosts = _posts;
  }

  void _filterPosts(Filter filter) {
    setState(() {
      _filteredPosts = _posts.where((post) {
        final matchesKeyword = filter.keyword == null || post.content.contains(filter.keyword!);
        final matchesDate = (filter.startDate == null || DateTime.parse(post.timestamp).isAfter(filter.startDate!)) &&
                            (filter.endDate == null || DateTime.parse(post.timestamp).isBefore(filter.endDate!));
        final matchesCategory = filter.categories.isEmpty || post.content.contains(filter.categories.join(' '));
        return matchesKeyword && matchesDate && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final filter = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterScreen(),
                ),
              );
              if (filter != null) {
                _filterPosts(filter);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredPosts.length,
        itemBuilder: (context, index) {
          final post = _filteredPosts[index];
          return PostCard(post: post);
        },
      ),
    );
  }
}

class Filter {
  final String? keyword;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> categories;

  Filter({
    this.keyword,
    this.startDate,
    this.endDate,
    required this.categories,
  });
}

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Center(
        child: Text('Filter options go here'),
      ),
    );
  }
}
