import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/view_model/navigation_view_model.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var textStyle = TextStyle(fontSize: 13);

  NavigationViewModel _navigationViewModel;

  Color backgroundColor = Color(0xFFFBFBFB);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _navigationViewModel =
        Provider.of<NavigationViewModel>(context, listen: false);

    return Consumer<NavigationViewModel>(
      builder: (_, viewModel, __) {
        return Scaffold(
          backgroundColor: Colors.white,

          body: viewModel.pages[viewModel.page],

          bottomNavigationBar: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Flexible(
                flex: 6,
                child: Theme(
                  data: ThemeData(
                    primaryColor: TrifoldColors.major,
                    accentColor: Color(0xffFBFBFB),
                    canvasColor: Color(0xffFBFBFB),
                  ),
                  child: Container(
                    color: TrifoldColors.major,
                    child: BottomNavigationBar(
                      elevation: 8,
                      backgroundColor: TrifoldColors.major,
                      selectedFontSize: 12,
                      unselectedFontSize: 12,
                      selectedItemColor: TrifoldColors.white,
                      unselectedItemColor: Color(0xffBFB0BD),
                      selectedLabelStyle: TextStyle(color: TrifoldColors.white),
                      unselectedLabelStyle: TextStyle(color: Color(0xffBFB0BD),),
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      iconSize: 20,
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[

                        BottomNavigationBarItem(
                            backgroundColor: backgroundColor,
                            title: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: viewModel.page == 0
                                        ? TrifoldColors.white
                                        : Color(0xffBFB0BD),),
                              ),
                            ),
                            icon: Container(
                              height: 20,
                              width: 30,
                              child: SvgPicture.asset(
                                'assets/images/home.svg',
                                color: viewModel.page == 0
                                    ? TrifoldColors.white
                                    : Color(0xffBFB0BD),
                                alignment: Alignment.center,
                              ),
                            )),
                        BottomNavigationBarItem(
                            backgroundColor: backgroundColor,
                            title: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: viewModel.page == 1
                                        ? TrifoldColors.white
                                        : Color(0xffBFB0BD),),
                              ),
                            ),
                            icon: Container(
                              height: 20,
                              width: 30,
                              child: SvgPicture.asset(
                                'assets/images/category.svg',
                                color: viewModel.page == 1
                                    ? TrifoldColors.white
                                    : Color(0xffBFB0BD),
                                alignment: Alignment.center,
                              ),
                            )),
                        BottomNavigationBarItem(
                            backgroundColor: backgroundColor,
                            title: Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "More",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: viewModel.page == 2
                                        ? TrifoldColors.white
                                        : Color(0xffBFB0BD),),
                              ),
                            ),
                            icon: Container(
                              height: 20,
                              width: 30,
                              child: SvgPicture.asset(
                                'assets/images/more.svg',
                                color: viewModel.page == 2
                                    ? TrifoldColors.white
                                    : Color(0xffBFB0BD),
                                alignment: Alignment.center,
                              ),
                            )),
                      ],
                      onTap: (index) {
                        viewModel.changePage(index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
