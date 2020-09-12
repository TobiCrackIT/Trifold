import 'package:flutter/material.dart';

class NavigationHelper{

  static goTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  static goAndClear(BuildContext context,Widget page){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => page));
  }
}