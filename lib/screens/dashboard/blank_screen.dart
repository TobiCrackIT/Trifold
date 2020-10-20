import 'package:flutter/material.dart';
import 'package:trifold/start_assessment_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  NavigationHelper.goTo(context, Assessment1());
                },
                  child: Text('Assessment...',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: TrifoldColors.major),)),

            ],
          ),
        ),
      ),
    );
  }
}
