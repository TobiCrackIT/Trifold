import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trifold/app/locator.dart';
import 'package:trifold/app/logger.dart';
import 'package:trifold/core/services/theme/theme_service.dart';
import 'package:trifold/screens/onboarding/onboarding_screen.dart';
import 'package:trifold/ui/theme/trifold_theme_data.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';
import 'package:trifold/view_model/auth_view_model.dart';
import 'package:trifold/view_model/navigation_view_model.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  await setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: TrifoldColors.major,
        systemNavigationBarColor: TrifoldColors.major,
        systemNavigationBarIconBrightness: Brightness.light));

    return MultiProvider(
      providers: [
        StreamProvider<ThemeMode>(
          create: (context) => locator<ThemeService>().themeModeData,
        ),
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: Consumer<ThemeMode>(
            builder: (_,themeMode,child){
              return MaterialApp(
                builder: (context, child) {
                  final mediaQueryData = MediaQuery.of(context);
                  return MediaQuery(
                    data: mediaQueryData.copyWith(textScaleFactor: 1),
                    child: child,
                  );
                },
                debugShowCheckedModeBanner: false,
                themeMode: themeMode,
                //theme: TrifoldThemeData.lightTheme,
                //darkTheme: TrifoldThemeData.darkTheme,
                home: OnBoardingScreen(),
                navigatorKey: locator<NavigationService>().navigatorKey,


              );
            }
        ),
      ),

      /*child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.done || snap.connectionState==ConnectionState.active){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Trifold',

              theme: ThemeData(
                primarySwatch: Colors.brown,
                fontFamily: 'Poppins',
              ),
              home: OnBoardingScreen(),
            );
          }
          return Container(color: TrifoldColors.white,);
        },
      ),*/
    );
  }
}
