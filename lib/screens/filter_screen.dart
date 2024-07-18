// lib/screens/filter_screen.dart
import 'package:flutter/material.dart';
import '../models/filter.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _keywordController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  final _categories = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Posts'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(labelText: 'Keyword'),
            ),
            // Additional UI components for date selection and categories
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Filter(
                    keyword: _keywordController.text,
                    startDate: _startDate,
                    endDate: _endDate,
                    categories: _categories,
                  ),
                );
              },
              child: Text('Apply Filter'),
            ),
          ],
        ),
      ),
    );
  }
}
