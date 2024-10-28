import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class NotificationModel {
  final String title;
  final String message;

  NotificationModel(this.title, this.message);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel('Notification 1', '09/08/2023, 21:13'),
    NotificationModel('Notification 2', '09/08/2023, 21:18'),
    // Add more notifications here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
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
