import 'package:flutter/material.dart';

class TrifoldPictureButton extends StatelessWidget {

  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  TrifoldPictureButton({this.title,this.imagePath,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
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
                child: Image.asset(imagePath),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff090209),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
