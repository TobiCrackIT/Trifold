import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trifold/screens/onboarding/onboarding_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/view_model/auth_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.done || snap.connectionState==ConnectionState.active){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Trifold',

              theme: ThemeData(
                primarySwatch: Colors.brown,
                fontFamily: 'Poppins',
              ),
              home: OnBoardingScreen(),
            );
          }
          return Container(color: TrifoldColors.white,);
        },
      ),
    );
  }
}
