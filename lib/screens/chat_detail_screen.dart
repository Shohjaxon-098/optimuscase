// lib/screens/chat_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/chat.dart';

class ChatDetailScreen extends StatefulWidget {
  final Chat chat;

  ChatDetailScreen({required this.chat});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                final message = widget.chat.messages[index];
                return ListTile(
                  title: Text(message.content),
                  subtitle: Text('Sent by: ${message.senderId}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final newMessage = Message(
      id: 'unique_message_id',
      senderId: 'current_user_id', // Replace with actual user ID
      content: _messageController.text,
      timestamp: DateTime.now(),
    );

    setState(() {
      widget.chat.messages.add(newMessage);
      _messageController.clear();
    });

    // Save the message to your backend or database
  }
}
