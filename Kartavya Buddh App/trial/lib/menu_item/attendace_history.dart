import 'package:flutter/material.dart';

void main() {
  runApp(History());
}

class NotificationModel {
  final String title;
  final String message;

  NotificationModel(this.title, this.message);
}
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel('Histroy 1', '09/08/2023, 15:13, marked'),
    NotificationModel('History 2', '09/08/2023, 15:18, not marked'),
    // Add more notifications here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance History'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.message),
          );
        },
      ),
    );
  }
}
