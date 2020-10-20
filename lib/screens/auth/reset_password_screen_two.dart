import 'package:flutter/material.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/custom_widgets/trifold_password_field.dart';
import 'package:trifold/screens/auth/sign_up_success_screen.dart';

class ResetPassword2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: MyCustomAppBar(
          height: 150,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:70,bottom:260),
                  child: Column(
                    children: <Widget>[
                      TrifoldPasswordField(title:'enter new password'),
                      Padding(
                        padding: const EdgeInsets.only(top:15,bottom:51),
                        child: TrifoldPasswordField(title:'confirm new password'),
                      ),
                      TrifoldButton(title: 'Continue',onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUpSuccessScreen()));
                      },),
                    ],
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

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 123,
          color: Color(0xff4A154B),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:56.2, left:29),
                child: Icon(Icons.arrow_back_ios,
                  color: Color(0xffffffff),
                ),
              ),
              Text('Reset Password',
                textAlign:TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
