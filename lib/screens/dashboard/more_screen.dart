import 'dart:html';

import 'package:flutter/material.dart';
import 'package:trifold/start_assessment_screen.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/utils/navigation_helper.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: TrifoldColors.major,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: TrifoldColors.white,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  children: [
                    Text('Full Name',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: TrifoldColors.black),),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.file_upload,size: 24,color: TrifoldColors.major,),
              SizedBox(width: 30,),
              Text('Upgrade Plans',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: TrifoldColors.major),),
            ],
          ),
          Divider(color: Color.fromRGBO(232, 232, 232, 0.75),),
        ],
      ),
    );
  }
}

