import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_vault/firebase_options.dart';
import 'package:student_vault/view/screens/login_screen.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'coves',
      ),
      home: const LoginPageWrapper(),   
    );
  }
}
