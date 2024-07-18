// lib/screens/zone_screen.dart
import 'package:flutter/material.dart';
import '../models/zone.dart';

class ZoneScreen extends StatefulWidget {
  @override
  _ZoneScreenState createState() => _ZoneScreenState();
}

class _ZoneScreenState extends State<ZoneScreen> {
  bool isPremiumUser = false; // Example: Check if the user is premium

  final List<Zone> zones = [
    Zone(
      id: '1',
      name: 'Startups Collaboration',
      type: ZoneType.group,
      status: ZoneStatus.free,
      members: ['user1', 'user2'],
      messages: [],
      files: [],
      createdBy: 'user1',
    ),
    Zone(
      id: '2',
      name: 'Tech Innovators',
      type: ZoneType.personal,
      status: ZoneStatus.premium,
      members: ['user3'],
      messages: [],
      files: [],
      createdBy: 'user2',
    ),
    // Add more zones here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zones'),
      ),
      body: ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          final zone = zones[index];
          if (zone.type == ZoneType.group && !isPremiumUser && zone.status == ZoneStatus.premium) {
            return Container(); // Skip premium zones for non-premium users
          }
          return ZoneCard(zone: zone);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createZone,
        child: Icon(Icons.add),
      ),
    );
  }

  void _createZone() {
    // Navigate to create zone screen
  }
}

class ZoneCard extends StatelessWidget {
  final Zone zone;

  ZoneCard({required this.zone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              zone.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text('Type: ${zone.type.toString().split('.').last}'),
            Text('Status: ${zone.status.toString().split('.').last}'),
            SizedBox(height: 5),
            Text('Members: ${zone.members.length}'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to zone details screen
              },
              child: Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}
