import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unifranzfind/firebase_options.dart';
import 'package:unifranzfind/login/ui/login.dart';
import 'package:unifranzfind/registro/ui/registro.dart';

void main() async {
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
      title: 'Material Appp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
