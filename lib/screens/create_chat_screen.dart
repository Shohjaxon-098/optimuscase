// lib/screens/create_chat_screen.dart
import 'package:flutter/material.dart';
import '../models/chat.dart';

class CreateChatScreen extends StatefulWidget {
  @override
  _CreateChatScreenState createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  final _nameController = TextEditingController();
  final _participantsController = TextEditingController();
  ChatStatus _selectedStatus = ChatStatus.free;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Chat Name'),
            ),
            TextField(
              controller: _participantsController,
              decoration: InputDecoration(labelText: 'Participants (comma-separated IDs)'),
            ),
            DropdownButton<ChatStatus>(
              value: _selectedStatus,
              onChanged: (ChatStatus? newValue) {
                setState(() {
                  _selectedStatus = newValue!;
                });
              },
              items: ChatStatus.values.map((ChatStatus status) {
                return DropdownMenuItem<ChatStatus>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createChat,
              child: Text('Create Chat'),
            ),
          ],
        ),
      ),
    );
  }

  void _createChat() {
    final newChat = Chat(
      id: 'unique_chat_id',
      name: _nameController.text,
      participants: _participantsController.text.split(',').map((id) => id.trim()).toList(),
      messages: [],
      status: _selectedStatus,
      createdBy: 'current_user_id', // Replace with actual user ID
    );

    // Save the chat object to your backend or database
    Navigator.pop(context);
  }
}
