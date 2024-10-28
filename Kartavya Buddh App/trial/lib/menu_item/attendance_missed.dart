import 'package:flutter/material.dart';

class AttendanceMissedPage extends StatefulWidget {
  @override
  _AttendanceMissedPageState createState() => _AttendanceMissedPageState();
}

class _AttendanceMissedPageState extends State<AttendanceMissedPage> {
  List<AttendanceMissedItem> _attendanceMissedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Missed'),
      ),
      body: ListView.builder(
        itemCount: _attendanceMissedList.length,
        itemBuilder: (context, index) {
          final item = _attendanceMissedList[index];
          return ListTile(
            title: Text('Date: ${item.date}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Time: ${item.time}'),
                Text('Reason: ${item.reason}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addAttendanceMissed(); // Call a function to add a new attendance missed item
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addAttendanceMissed() {
    // Show a dialog to input date, time, and reason
    showDialog(
      context: context,
      builder: (context) {
        String date = '';
        String time = '';
        String reason = '';

        return AlertDialog(
          title: Text('Add Attendance Missed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => date = value,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextField(
                onChanged: (value) => time = value,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextField(
                onChanged: (value) => reason = value,
                decoration: InputDecoration(labelText: 'Reason'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add the new item to the list
                setState(() {
                  _attendanceMissedList.add(
                    AttendanceMissedItem(date: date, time: time, reason: reason),
                  );
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class AttendanceMissedItem {
  final String date;
  final String time;
  final String reason;

  AttendanceMissedItem({required this.date, required this.time, required this.reason});
}
