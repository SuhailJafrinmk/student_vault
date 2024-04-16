
import 'package:flutter/material.dart';
import 'package:student_vault/view/constants/constants.dart';

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: setText(),
      ),
      body: ListView(
        children: [
          buildTimetableDay('Monday', [
            '9:00 AM - 10:30 AM: Introduction to Flutter',
            '11:00 AM - 12:30 PM: Setting up Flutter Environment',
            '2:00 PM - 3:30 PM: Creating Your First Flutter Project',
          ]),
          buildTimetableDay('Tuesday', [
            '9:00 AM - 10:30 AM: Flutter Widgets',
            '11:00 AM - 12:30 PM: Layouts in Flutter',
            '2:00 PM - 3:30 PM: Handling User Input',
          ]),
          buildTimetableDay('Wednesday', [
            '9:00 AM - 10:30 AM: Navigation in Flutter',
            '11:00 AM - 12:30 PM: State Management in Flutter',
            '2:00 PM - 3:30 PM: Building UI with Flutter',
          ]),
          buildTimetableDay('Thursday', [
            '9:00 AM - 10:30 AM: Working with APIs in Flutter',
            '11:00 AM - 12:30 PM: Persistence and Storage in Flutter',
            '2:00 PM - 3:30 PM: Flutter UI Design Principles',
          ]),
          buildTimetableDay('Friday', [
            '9:00 AM - 10:30 AM: Advanced Topics in Flutter',
            '11:00 AM - 12:30 PM: Testing and Debugging in Flutter',
            '2:00 PM - 3:30 PM: Firebase Integration with Flutter',
          ]),
          buildTimetableDay('Saturday', [
            '9:00 AM - 10:30 AM: Deployment of Flutter Apps',
            '11:00 AM - 12:30 PM: Wrap-up and Q&A Session',
          ]),
        ],
      ),
    );
  }

  Widget buildTimetableDay(String day, List<String> activities) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: activities.map((activity) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  activity,
                  style: TextStyle(fontSize: 16.0),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}