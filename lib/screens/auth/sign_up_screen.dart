import 'package:flutter/material.dart';
import 'package:trifold/custom_widgets/hide_keyboard_container.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/custom_widgets/trifold_textform_field_password.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            'Sign Up',
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      maxLines: 1,
                      obscureText: false,
                      autovalidate: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF4F4C4F),
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                          fontSize: 12,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: TrifoldTextformFieldPassword(
                    title: 'Password',
                    textEditingController: passwordController,
                  ),
                ),
                TrifoldTextformFieldPassword(
                  title: 'Confirm Password',
                  textEditingController: confirmPasswordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(value: false, groupValue: 1, onChanged: (value) {}),
                      Text(
                        'I agree to Trifold\’s Privacy Policy',
                        style: TextStyle(
                          color: Color(0xffD3CA00),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TrifoldButton(
                  title: 'Continue',
                  onPressed: () {
                    print(
                        'Email : ${emailController.text}\nPassword : ${passwordController.text}\nConfirm password : ${confirmPasswordController.text}');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Container()));
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 22),
                    child: Column(
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
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Container())),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(color: Color(0xFFBABABA), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Container())),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 24),
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
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Container())),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Have an account? ',
                          style: TextStyle(
                            color: Color(0xffD3CA00),
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              NavigationHelper.goTo(context, Container()),
                          child: Text(
                            ' Log In',
                            style: TextStyle(
                              color: Color(0xffD3CA00),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }*/
}
