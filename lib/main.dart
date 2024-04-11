// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker_getx_firebase/firebase_options.dart';
import 'package:expense_tracker_getx_firebase/view/add_amount_screen/add_amount_screen.dart';
import 'package:expense_tracker_getx_firebase/view/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      home: AddAmount(),
    );
  }
}
