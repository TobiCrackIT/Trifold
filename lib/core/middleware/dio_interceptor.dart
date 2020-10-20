import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trifold/app/locator.dart';
import 'package:trifold/core/middleware/dio_request_retrier.dart';
import 'package:trifold/core/services/storage/storage_service.dart';

class DioInterceptor extends Interceptor {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();

  final DioRequestRetrier requestRetrier;

  DioInterceptor({this.requestRetrier});

  final _log = Logger('Dio Interceptor');

  bool _authURL = false;

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (options.path.contains("ben")) {
      _authURL = true;
    }

    Map<String, String> headers = new Map();
    headers['Content-Type'] = 'application/json';

    /*if (options.path.contains("instant") || options.path.contains("/me")) {
      String _apiKey = _storageService.bushaAPIKey;
      if (_apiKey == "" || _apiKey == null) {
        _navigationService.clearStackAndShow(Routes.welcomeView);
      }
      headers['BUSHA_BEARER'] = _apiKey;
    }

    headers['Mobile-App'] = 't';
    headers['Device-Id'] =
        Uri.encodeFull(Uri.encodeFull(_hardwareInfoService.udid));
    headers['Device-Name'] =
        Uri.encodeFull(Uri.encodeFull(_hardwareInfoService.device));*/

    options.headers.addAll(headers);
//    options.connectTimeout = 2500;
//    options.receiveTimeout = 2500;

    return options;
  }

  @override
  Future<dynamic> onError(DioError e) async {
    _log.info("Network error - $e");

    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      _log.info("Time out error");
    }

    if (e.type == DioErrorType.RESPONSE && e.response.statusCode == 401) {
      // return user to welcome screen
      if (!_authURL) {
        //_navigationService.replaceWithTransition(WelcomeView(), transition: NavigationTransition.Fade);
      }
    }

    if (_shouldRetry(e)) {
      try {
        return requestRetrier.retryRequest(e.request);
      } catch (e) {
        return e;
      }
    }

    return e;
  }

  bool _shouldRetry(DioError e) {
    return e.type == DioErrorType.DEFAULT &&
        e.error != null &&
        e.error is SocketException;
  }
}