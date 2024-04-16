
import 'package:flutter/material.dart';
import 'package:student_vault/view/constants/constants.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: setText(text: 'Course details',size: 25,color: quaternary,fontWeight: FontWeight.w900)
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image:  AssetImage('assets/images/fluter-logo_png.png'),)
            ),
            height: setScreenHeight(context, .3),
            width: setScreenWidth(context, 1),
          ),
          Expanded(child: ListView(
        children: [
          buildModule('Module 1: Getting Started with Flutter', [
            'Introduction to Flutter',
            'Setting up Flutter Development Environment',
            'Creating your first Flutter project',
            'Understanding the project structure',
          ]),
          buildModule('Module 2: Flutter Basics', [
            'Widgets in Flutter',
            'Stateless vs. Stateful Widgets',
            'Building UI with Widgets',
            'Handling User Input',
            'Layouts in Flutter',
          ]),
           buildModule('Module 3: Navigation and Routing', [
            'Navigation basics in Flutter',
            'Navigating between screens',
            'Passing data between screens',
            'Named routes',
          ]),
            buildModule('Module 4: State Management', [
            'Introduction to State Management',
            'setState method',
            'Scoped Model',
            'Provider package',
            'BLoC pattern',
            'GetX package',
          ]),
          buildModule('Module 5: Working with APIs', [
            'Making HTTP requests in Flutter',
            'Parsing JSON data',
            'Displaying data fetched from an API',
            'Error handling',
          ]),
            buildModule('Module 6: Flutter UI Design', [
            'Material Design and Cupertino Design',
            'Customizing themes',
            'Working with Fonts and Icons',
            'Animations in Flutter',
          ]),
           buildModule('Module 7: Persistence and Storage', [
            'Working with Local Storage (Shared Preferences, SQLite)',
            'File Operations (Reading/Writing Files)',
            'Using Key-Value Storage (Hive, Sembast)',
          ]),
          buildModule('Module 8: Flutter and Firebase', [
            'Introduction to Firebase',
            'Integrating Firebase Authentication',
            'Firebase Cloud Firestore for data storage',
            'Firebase Cloud Messaging for push notifications',
          ]),
           buildModule('Module 9: Testing and Debugging', [
            'Unit testing in Flutter',
            'Widget testing',
            'Debugging techniques',
            'Logging and monitoring',
          ]),
            buildModule('Module 10: Deployment', [
            'Building for Android and iOS',
            'Debug and Release builds',
            'Publishing your app to Google Play Store and Apple App Store',
          ]),
          // Add more modules similarly
        ],
      ),)
          ],
      ),
    );
  }
}



  Widget buildModule(String title, List<String> topics) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: topics.map((topic) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- $topic',
                  style: const TextStyle(fontSize: 16.0),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
