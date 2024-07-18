// lib/screens/chat_list_screen.dart
import 'package:flutter/material.dart';
import 'package:optimuscase/screens/chat_detail_screen.dart';
import '../models/chat.dart';

class ChatListScreen extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
      id: '1',
      name: 'Team Discussion',
      participants: ['user1', 'user2', 'user3'],
      messages: [],
      status: ChatStatus.free,
      createdBy: 'user1',
    ),
    Chat(
      id: '2',
      name: 'Project Feedback',
      participants: ['user2', 'user4'],
      messages: [],
      status: ChatStatus.premium,
      createdBy: 'user2',
    ),
    // Add more chats here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatCard(chat: chat);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startNewChat,
        child: Icon(Icons.add),
      ),
    );
  }

  void _startNewChat() {
    // Navigate to create new chat screen
  }
}

class ChatCard extends StatelessWidget {
  final Chat chat;

  ChatCard({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(chat.name),
        subtitle: Text('Participants: ${chat.participants.length}'),
        onTap: () {
          // Navigate to chat details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailScreen(chat: chat),
            ),
          );
        },
      ),
    );
  }
}
