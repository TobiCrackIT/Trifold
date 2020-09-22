import 'package:flutter/material.dart';
import 'package:trifold/custom_widgets/trifold_button_two.dart';
import 'package:trifold/screens/auth/log_in_screen.dart';
import 'package:trifold/screens/auth/sign_up_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';

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
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/images/design.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/images/design.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
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
              child:TrifoldButton2(title: 'Sign Up',onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },),
            ),
            TrifoldButton2(title: 'Log In',onPressed: (){

              NavigationHelper.goTo(context, LogInScreen());

            },),
          ],
        ),
      ),
    );
  }
}
