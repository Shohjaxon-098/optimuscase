// lib/screens/notifications_screen.dart
import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationsScreen extends StatelessWidget {
  final bool isPremiumUser;

  NotificationsScreen({required this.isPremiumUser});

  @override
  Widget build(BuildContext context) {
    final List<NotificationMod> notifications = [
      NotificationMod(
        id: '1',
        type: NotificationType.post,
        title: 'New Post Available',
        description: 'Check out the latest post on our platform.',
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
        isPremium: false,
      ),
      NotificationMod(
        id: '2',
        type: NotificationType.vacancy,
        title: 'New Vacancy Posted',
        description: 'A new vacancy is available for premium users.',
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        isPremium: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          if (notification.isPremium && !isPremiumUser) {
            return Container(); // Skip non-premium notifications for non-premium users
          }
          return NotificationCard(notification: notification);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationMod notification;

  NotificationCard({required this.notification});

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
              notification.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(notification.description),
            SizedBox(height: 5),
            Text(
              notification.timestamp.toLocal().toString(),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
