import 'package:flutter/material.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
class TrifoldButton2 extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  TrifoldButton2({this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
        decoration: BoxDecoration(
            color: TrifoldColors.white,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        padding: EdgeInsets.symmetric(vertical: 14),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
              color: Color(0xff4A154B),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

