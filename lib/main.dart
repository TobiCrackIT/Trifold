import 'package:flutter/material.dart';
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
