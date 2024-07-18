// lib/screens/case_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/case.dart';

class CaseDetailScreen extends StatelessWidget {
  final Case caseItem;

  CaseDetailScreen({required this.caseItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(caseItem.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title: ${caseItem.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text('Description: ${caseItem.description}'),
            SizedBox(height: 10),
            Text('Type: ${caseItem.type.toString().split('.').last}'),
            Text('Status: ${caseItem.status.toString().split('.').last}'),
            Text('Start Date: ${caseItem.startDate.toLocal()}'),
            Text('End Date: ${caseItem.endDate.toLocal()}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Join or participate in the case
              },
              child: Text('Join Case'),
            ),
          ],
        ),
      ),
    );
  }
}
