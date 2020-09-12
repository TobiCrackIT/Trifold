import 'package:flutter/material.dart';
import 'package:trifold/screens/auth/sign_in_screen.dart';
import 'package:trifold/screens/auth/sign_up_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TrifoldColors.major,
      body: Padding(
        padding: const EdgeInsets.only(top: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/design.png',
              fit: BoxFit.cover,
            ),
            Image.asset('assets/images/design.png',fit: BoxFit.fill,),
            Image.asset('assets/images/design.png'),
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 8),
              child: Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Text(
              'Trifold',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 57, bottom: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen())),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 37),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(color: TrifoldColors.major, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogInScreen())),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                padding: EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 37),
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(color: TrifoldColors.major, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}