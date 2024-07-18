// lib/screens/case_list_screen.dart
import 'package:flutter/material.dart';
import '../models/case.dart';
import 'case_detail_screen.dart';

class CaseListScreen extends StatelessWidget {
  final List<Case> cases = [
    Case(
      id: '1',
      title: 'Innovation Challenge',
      description: 'Solve an innovation challenge for tech startups.',
      type: CaseType.challenge,
      startDate: DateTime.now().subtract(Duration(days: 10)),
      endDate: DateTime.now().add(Duration(days: 20)),
      status: CaseStatus.open,
      companyId: 'company1',
      requirements: [],
      location: '',
    ),
    Case(
      id: '2',
      title: 'Recruitment Drive',
      description: 'Recruit top talent for your company.',
      type: CaseType.recruitment,
      startDate: DateTime.now().subtract(Duration(days: 5)),
      endDate: DateTime.now().add(Duration(days: 15)),
      status: CaseStatus.open,
      companyId: 'company2',
      requirements: [],
      location: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cases'),
      ),
      body: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          final caseItem = cases[index];
          return CaseCard(caseItem: caseItem);
        },
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  final Case caseItem;

  CaseCard({required this.caseItem});

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
              caseItem.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text('Type: ${caseItem.type.toString().split('.').last}'),
            Text('Status: ${caseItem.status.toString().split('.').last}'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailScreen(caseItem: caseItem),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}
