import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trifold/core/services/connectivity/connectivity_service.dart';
import 'package:trifold/core/services/connectivity/connectivity_service_impl.dart';
import 'package:trifold/core/services/storage/storage_service.dart';
import 'package:trifold/core/services/storage/storage_service_impl.dart';
import 'package:trifold/core/services/theme/theme_service.dart';

GetIt locator=GetIt.instance;

Future<void> setUpLocator()async{

  locator.registerLazySingleton<ConnectivityService>(() => ConnectivityServiceImpl());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());


  await _setupSharedPreferences();
  locator.registerLazySingleton<ThemeService>(() => ThemeService());

}

Future<void> _setupSharedPreferences() async {
  final instance = await StorageServiceImpl.getInstance();
  locator.registerLazySingleton<StorageService>(() => instance);
}