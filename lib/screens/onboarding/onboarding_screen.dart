import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trifold/custom_widgets/trifold_button.dart';
import 'package:trifold/screens/auth/welcome_screen.dart';
import 'package:trifold/utils/navigation_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<String> OnBoardingText=[
    'Two are better than one; because they have a good reward for their labour',
    'A threefold cord is not quickly broken',
    'Congratulations! \n Your password was successfully reset',
  ];

  final List<String> images=[
    'assets/images/conv.png','assets/images/fam.png','assets/images/doctor.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Swiper(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              NavigationHelper.goAndClear(context, WelcomeScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:20.0),
                              child: Text(
                                'Skip',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15, color: Color(0xffD3CA00)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 44.22),
                        child: Container(
                            height: 232,
                            width: 281,
                            child: Image.asset('${images[index]}')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom:30),
                        child: Text(
                          '${OnBoardingText[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff4A154B),
                          ),
                        ),
                      ),

                      /*TrifoldButton(title: 'Next',onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OnBoardingScreenTwo()));
                      },),*/
                    ],
                  ),
                );
                },
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(activeColor: Color(0xffD3CA00), color: Color(0xffE7E6E6))
              ),
              control: SwiperControl(iconNext: null,iconPrevious: null),

            ),
      ),
    );
  }
}

Widget userTile(String names,) {
  return ListTile(
    title: Text(
      '$names',
      style: TextStyle(
          color: Colors.black87, fontSize: 80, fontWeight: FontWeight.w500),
    ),
  );
}
