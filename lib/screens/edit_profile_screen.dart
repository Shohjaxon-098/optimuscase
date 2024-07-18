// lib/screens/edit_profile_screen.dart
import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfileScreen extends StatefulWidget {
  final Profile profile;

  EditProfileScreen({required this.profile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _companyNameController;
  late TextEditingController _aboutController;
  late TextEditingController _locationController;
  late TextEditingController _statusController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _companyNameController = TextEditingController(text: widget.profile.companyName);
    _aboutController = TextEditingController(text: widget.profile.about);
    _locationController = TextEditingController(text: widget.profile.location);
    _statusController = TextEditingController(text: widget.profile.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(labelText: 'About'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated profile data here
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
