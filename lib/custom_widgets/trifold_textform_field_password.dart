import 'package:flutter/material.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';


class TrifoldTextformFieldPassword extends StatelessWidget {
  final String title;

  TrifoldTextformFieldPassword({this.title, });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 41,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        maxLines: 1,
        obscureText: false,
        autovalidate: false,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Color(0xFF4F4C4F),
          fontSize: 12,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Color(
                0xff6F6C6E,
              ),
            ),
            labelText: '$title',
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
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            suffixIcon: Icon(
              Icons.visibility_off,
              color: Color(
                0xff6F6C6E,
              ),
            )),
      ),
    );

  }
}