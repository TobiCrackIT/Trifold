import 'package:flutter/material.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/screens/auth/log_in_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';

class SignUpSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TrifoldColors.major,
          title: Text(
            'Success',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/tick.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 55),
                        child: Text(
                          'Congratulations! \n Your account has been created',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      TrifoldButton(
                        title: 'Continue',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                      ),
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
                padding: const EdgeInsets.only(right: 56.2, left: 29),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffffffff),
                ),
              ),
              Text(
                'Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
