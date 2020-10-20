import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:stacked/stacked.dart';
import 'package:trifold/ui/views/onBoarding/on_boarding_view_model.dart';

class OnBoardingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      builder: (context,model,child){
        return Container(
          color: Theme.of(context).colorScheme.primary,
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
                              //NavigationHelper.goAndClear(context, WelcomeScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:40.0),
                              child: Text(
                                'Skip',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Color(0xffD3CA00)),
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
                            child: Image.asset('${model.images[index]}')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom:30),
                        child: Text(
                          '${model.onBoardingText[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff4A154B),
                          ),
                        ),
                      ),

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
      },
      viewModelBuilder: ()=>OnBoardingViewModel(),
    );
  }
}
