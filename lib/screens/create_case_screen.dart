// lib/screens/create_case_screen.dart
import 'package:flutter/material.dart';
import '../models/case.dart';

class CreateCaseScreen extends StatefulWidget {
  @override
  _CreateCaseScreenState createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  final _requirementsController = TextEditingController();
  final _locationController = TextEditingController();
  CaseStatus _status = CaseStatus.upcoming;
CaseType _type=CaseType.challenge;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Case'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Case Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _requirementsController,
              decoration: InputDecoration(labelText: 'Requirements (comma-separated)'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            Text('Start Date'),
            TextButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _startDate = pickedDate;
                  });
                }
              },
              child: Text(_startDate == null ? 'Select Date' : _startDate.toString()),
            ),
            SizedBox(height: 20),
            Text('End Date'),
            TextButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _endDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _endDate = pickedDate;
                  });
                }
              },
              child: Text(_endDate == null ? 'Select Date' : _endDate.toString()),
            ),
            SizedBox(height: 20),
            DropdownButton<CaseStatus>(
              value: _status,
              onChanged: (CaseStatus? newValue) {
                setState(() {
                  _status = newValue!;
                });
              },
              items: CaseStatus.values.map((CaseStatus status) {
                return DropdownMenuItem<CaseStatus>(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createCase,
              child: Text('Create Case'),
            ),
          ],
        ),
      ),
    );
  }

  void _createCase() {
    final newCase = Case(
      id: 'unique_case_id',
      title: _titleController.text,
      description: _descriptionController.text,
      startDate: _startDate ?? DateTime.now(),
      endDate: _endDate ?? DateTime.now().add(Duration(days: 30)),
      requirements: _requirementsController.text.split(',').map((e) => e.trim()).toList(),
      companyId: 'company_id',
      status: _status,
      location: _locationController.text, type: _type,
    );

    // Save the new case to your backend or local database

    Navigator.pop(context);
  }
}
