import 'package:flutter/material.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/status.dart';

class TrifoldButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Status status;

  TrifoldButton({this.title, this.onPressed, this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
            color: status != Status.LOADING
                ? TrifoldColors.major
                : TrifoldColors.major.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        padding: EdgeInsets.symmetric(vertical: 14),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: status != null && status == Status.LOADING
              ? Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3.0,
                  ),
                )
              : Text(
                  '$title',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 14,
                  ),
                ),
        ),
      ),
    );
  }
}
