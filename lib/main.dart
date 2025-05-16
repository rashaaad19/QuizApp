import 'package:flutter/material.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/login_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/screens/score_screen.dart';
import 'package:quizapp/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}




