import 'package:flutter/material.dart';
import 'package:trifold/custom_widgets/hide_keyboard_container.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/custom_widgets/trifold_picture_button.dart';
import 'package:trifold/custom_widgets/trifold_textform_field_password.dart';
import 'package:trifold/screens/auth/log_in_screen.dart';
import 'package:trifold/screens/auth/sign_up_success_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';
import 'package:trifold/utils/status.dart';
import 'package:trifold/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  //TODO : 5. Make some processes abstract
  //TODO : 7. Smart sign up/log-in process
  //TODO : 8. Extend custom widget functionalities
  //TODO : 9. Use services
  //TODO : 10. Refactor codebase

  @override
  Widget build(BuildContext context) {

    final _authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Consumer<AuthViewModel>(
      builder: (__, model, child) {

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (model.getSignUpStatus() == Status.SUCCESS) {
            model.clearStatus();
            NavigationHelper.goAndClear(context, SignUpSuccessScreen());
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
                    SizedBox(height: 25,),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          maxLines: 1,
                          obscureText: false,
                          autovalidate: false,
                          onChanged: (value) {
                            model.setEmail(value);
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff4F4C4F),
                            ),
                            hasFloatingPlaceholder: false,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
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
                      textEditingController: passwordController,
                      onChanged: (value) {
                        model.setPassword(value);
                      },
                    ),

                    TrifoldTextformFieldPassword(
                      title: 'Confirm Password',
                      textEditingController: confirmPasswordController,
                      onChanged: (value) {
                        model.setConfirmPassword(value);
                      },
                    ),

                    Visibility(
                      visible: model.getErrorMessage() != '',
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, left: 30,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Text(
                              '${model.getErrorMessage()}',
                              style: TextStyle(color: Colors.red),
                            )),
                          ],
                        ),
                      ),
                    ),
                    /*Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: false,
                              groupValue: 1,
                              onChanged: (value) {}),
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
                    ),*/

                    SizedBox(height: 20,),
                    TrifoldButton(
                      title: 'Continue',
                      status: model.getSignUpStatus(),
                      onPressed: () {
                        model.signUp();
                      },
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    TrifoldPictureButton(
                      title: 'Sign up with Google',
                      imagePath: 'assets/images/g.png',
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container())),
                    ),
                    TrifoldPictureButton(
                      title: 'Sign up with Facebook',
                      imagePath: 'assets/images/f.png',
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container())),
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
                                  NavigationHelper.goTo(context, LogInScreen()),
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
      },
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

  /*Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      dbRef.set({
        "email": emailController.text,
        "age": ageController.text,
        "name": nameController.text
      });

      return authResult.user != null;
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(e.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }
*/

  /*void registerToFirebase() async {
    setState(() {
      isLoading = true;
    });

    firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((value) {
      dbRef.child(value.user.uid).set({
        "email": emailController.text,
        "age": ageController.text,
        "name": nameController.text,
      }).then((result) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                firebaseUser: value.user,
              )),
        );
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(error.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }*/

}
