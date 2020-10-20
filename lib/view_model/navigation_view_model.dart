import 'package:flutter/foundation.dart';
import 'package:trifold/screens/dashboard/blank_screen.dart';
import 'package:trifold/screens/dashboard/more_screen.dart';

class NavigationViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  int get page => _pageIndex;


  var pages = [
    BlankScreen(),
    BlankScreen(),
    MoreScreen(),
  ];

  changePage(int i) {
    _pageIndex = i;
    notifyListeners();
  }
}