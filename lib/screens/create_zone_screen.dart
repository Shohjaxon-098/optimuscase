// lib/screens/create_zone_screen.dart
import 'package:flutter/material.dart';
import '../models/zone.dart';

class CreateZoneScreen extends StatefulWidget {
  @override
  _CreateZoneScreenState createState() => _CreateZoneScreenState();
}

class _CreateZoneScreenState extends State<CreateZoneScreen> {
  final _nameController = TextEditingController();
  ZoneType _selectedType = ZoneType.group;
  ZoneStatus _selectedStatus = ZoneStatus.free;
  final _membersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Zone'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Zone Name'),
            ),
            DropdownButton<ZoneType>(
              value: _selectedType,
              onChanged: (ZoneType? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: ZoneType.values.map((ZoneType type) {
                return DropdownMenuItem<ZoneType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
            ),
            DropdownButton<ZoneStatus>(
              value: _selectedStatus,
              onChanged: (ZoneStatus? newValue) {
                setState(() {
                  _selectedStatus = newValue!;
                });
              },
              items: ZoneStatus.values.map((ZoneStatus status) {
                return DropdownMenuItem<ZoneStatus>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
            ),
            TextField(
              controller: _membersController,
              decoration: InputDecoration(labelText: 'Members (comma-separated IDs)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createZone,
              child: Text('Create Zone'),
            ),
          ],
        ),
      ),
    );
  }

  void _createZone() {
    final zone = Zone(
      id: 'unique_zone_id',
      name: _nameController.text,
      type: _selectedType,
      status: _selectedStatus,
      members: _membersController.text.split(',').map((id) => id.trim()).toList(),
      messages: [],
      files: [],
      createdBy: 'current_user_id', // Replace with actual user ID
    );

    // Save the zone object to your backend or database
    Navigator.pop(context);
  }
}
