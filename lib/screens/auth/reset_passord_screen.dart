import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/view_model/auth_view_model.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (_,model,__){
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
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),
              ),
              centerTitle: true,
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 30),
              children: [
                Text(
                  'Enter the email associated \n with your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff4A154B),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  margin:
                  EdgeInsets.symmetric(vertical: 20,),
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TrifoldButton(
                    title: 'Continue',
                    onPressed: () {
                      model.resetPassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
}*/
