import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trifold/app/locator.dart';
import 'package:trifold/core/enums/connectivity_status.dart';
import 'package:trifold/core/services/connectivity/connectivity_service.dart';

class DioRequestRetrier {
  final Dio dio;
  final _connectivityService = locator<ConnectivityService>();

  DioRequestRetrier({@required this.dio});

  Future<Response> retryRequest(RequestOptions requestOptions) async {
    StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = _connectivityService.connectivity$.listen(
          (ConnectivityStatus status) {
        if (status != ConnectivityStatus.Offline) {
          streamSubscription.cancel();
          responseCompleter.complete(
            dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: requestOptions,
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}