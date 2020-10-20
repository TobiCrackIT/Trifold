
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trifold/app/locator.dart';

class OnBoardingViewModel extends BaseViewModel{
  final _navigationService=locator<NavigationService>();

  List<String> _onBoardingText=[
    'Two are better than one; because they have a good reward for their labour',
    'A threefold cord is not quickly broken',
    'Congratulations! \n Your password was successfully reset',
  ];

  List<String> _images=[
    'assets/images/conv.png','assets/images/fam.png','assets/images/doctor.png'
  ];

  List<String> get onBoardingText=>_onBoardingText;
  List<String> get images=>_onBoardingText;

}