import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_vault/firebase_options.dart';
import 'package:student_vault/view/screens/home_page.dart';
import 'package:student_vault/view/screens/login_screen.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth=FirebaseAuth.instance;
  final User ?user=auth.currentUser;
  runApp( MyApp(user: user,));
}

class MyApp extends StatelessWidget {
  final User?user;

  const MyApp({super.key, this.user});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'coves',
      ),
      home: user != null ? HomePageWrapper() : LoginPageWrapper(),   
    );
  }
}
