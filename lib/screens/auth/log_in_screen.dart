import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trifold/custom_widgets/hide_keyboard_container.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/custom_widgets/trifold_textform_field_password.dart';
import 'package:trifold/screens/auth/sign_up_screen.dart';
import 'package:trifold/start_assessment_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';
import 'package:trifold/utils/status.dart';
import 'package:trifold/view_model/auth_view_model.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Consumer<AuthViewModel>(
      builder: (context, model, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (model.getLogInStatus() == Status.SUCCESS) {
            model.clearStatus();
            NavigationHelper.goAndClear(context, Assessment1());
          }
        });

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: TrifoldColors.major,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffffffff),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'Log In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: HideKeyboardContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                      child: TextFormField(
                        maxLines: 1,
                        obscureText: false,
                        autovalidate: false,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (v) {
                          model.setEmail(v);
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF4F4C4F),
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color(
                              0xff6F6C6E,
                            ),
                          ),
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xff4F4C4F),
                          ),
                          hasFloatingPlaceholder: false,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            borderSide: BorderSide(
                              color: Color(0xFFE5E5E5),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5),
                                  width: 2,
                                  style: BorderStyle.solid)),
                        ),
                      ),
                    ),
                    TrifoldTextformFieldPassword(
                      title: 'Password',
                      onChanged: (v) => model.setPassword(v),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen())),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 19),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Color(0xffD3CA00),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    TrifoldButton(
                      title: 'Log In',
                      onPressed: () {
                        model.login();
                      },
                      status: model.getLogInStatus(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 37, bottom: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>model.signInWithGoogle(),
                      //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen())),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border:
                                Border.all(color: Color(0xFFBABABA), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Image.asset('assets/images/g.png'),
                              ),
                              Text(
                                'Sign up with Google',
                                style: TextStyle(
                                  color: Color(0xff090209),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen())),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, bottom: 24),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                  color: Color(0xFFBABABA), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Image.asset('assets/images/f.png'),
                                ),
                                Text(
                                  'Sign up with Facebook',
                                  style: TextStyle(
                                    color: Color(0xff090209),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Color(0xffD3CA00),
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                NavigationHelper.goTo(context, SignUpScreen()),
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                color: Color(0xffD3CA00),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
