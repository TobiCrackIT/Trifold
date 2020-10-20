import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trifold/custom_widgets/hide_keyboard_container.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/custom_widgets/trifold_link_text.dart';
import 'package:trifold/custom_widgets/trifold_password_field.dart';
import 'package:trifold/custom_widgets/trifold_picture_button.dart';
import 'package:trifold/screens/auth/reset_passord_screen.dart';
import 'package:trifold/screens/auth/sign_up_screen.dart';
import 'package:trifold/screens/dashboard/app_menu.dart';
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
            body:  HideKeyboardContainer(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 45,horizontal: 30),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      margin:
                          EdgeInsets.only(bottom: 20),
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
                              horizontal: 22, vertical: 16),
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
                    TrifoldPasswordField(
                      title: 'Password',
                      onChanged: (v) => model.setPassword(v),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TrifoldLinkText(title:'Forgot password?',onTapped:()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen())) ,),
                      ],
                    ),

                    TrifoldButton(
                      title: 'Log In',
                      onPressed: () {
                        NavigationHelper.goTo(context, AppHome());
                        //model.login();
                      },
                      status: model.getLogInStatus(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 37, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    TrifoldPictureButton(title:'Sign up with Google',imagePath: 'assets/images/g.png',onPressed:()=>model.signInWithGoogle(),),
                    SizedBox(height: 12,),
                    TrifoldPictureButton(title:'Sign up with Facebook',imagePath: 'assets/images/f.png',onPressed:()=>model.signInWithGoogle(),),
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
                          TrifoldLinkText(title:'Sign Up',onTapped:()=>Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen())) ,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
        );
      },
    );
  }
}
