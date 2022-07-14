import 'package:app/dashboard/login.dart';
import 'package:app/dashboard/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MainPage());
}



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Login(),

    );
  }
}