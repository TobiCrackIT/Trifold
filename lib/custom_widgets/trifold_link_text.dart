import 'package:flutter/material.dart';

class TrifoldLinkText extends StatelessWidget {

  final VoidCallback onTapped;
  final String title;

  TrifoldLinkText({this.title,this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped(),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 19),
        child: Text(
          '$title',
          style: TextStyle(
              color: Color(0xffD3CA00),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
