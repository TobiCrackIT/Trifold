import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trifold/screens/onboarding/on_boarding_screen_one.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TrifoldColors.major,
      body: Center(
        child: Image.asset(
          'assets/images/trilogo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  startSplashTime() async {
    var duration = new Duration(milliseconds: 5000);
    return new Timer(duration, navigateToPage);
  }

  void navigateToPage() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingScreenOne()));
    /*sharedPreferences = await SharedPreferences.getInstance();
    bool _seen = (sharedPreferences.getBool(PokerStrings.SEEN) ?? false);
    bool _loggedIn = (sharedPreferences.getBool(PokerStrings.LOGGED_IN) ?? false);
    if (_seen == true) {
      debugPrint('I have seen it.');
      if(_loggedIn){
        debugPrint('User is logged in.');
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>InputPinScreen()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>InputPinScreen()));
      }
    } else {
      sharedPreferences.setBool(PokerStrings.SEEN, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()));
    }*/
  }
}
