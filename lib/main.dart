import 'package:flutter/material.dart';
import 'package:trifold/MHA4.dart';
import 'package:trifold/MHA5.dart';
import 'package:trifold/MHA6.dart';
import 'package:trifold/screens/auth/sign_up_screen.dart';
import 'package:trifold/Verification.dart';
import 'package:trifold/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trifold',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(),
    );
  }
}
