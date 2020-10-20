import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:trifold/core/exceptions/network_exception.dart';
import 'package:trifold/core/middleware/dio_interceptor.dart';
import 'package:trifold/core/middleware/dio_request_retrier.dart';

import 'http_service.dart';

const _defaultConnectTimeout = 30 * 1000;
const _defaultReceiveTimeout = 30 * 1000;
const _defaultSendTimeout = 30 * 1000;

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl implements HttpService {
  final _log = Logger('HttpServiceImpl');

  Dio _dio;

  HttpServiceImpl() {
    _dio = Dio();
    _dio.options.connectTimeout = _defaultConnectTimeout;
    _dio.options.receiveTimeout = _defaultReceiveTimeout;
    _dio.options.sendTimeout = _defaultSendTimeout;
    _dio.options.contentType = 'application/json';
    _dio.interceptors.add(
      DioInterceptor(
        requestRetrier: DioRequestRetrier(
          dio: _dio,
        ),
      ),
    );
  }

  @override
  Future<dynamic> getHttp(String route) async {
    Response response;

    _log.fine('Sending GET to $route');

    try {
      final fullRoute = '$route';
      response = await _dio.get(fullRoute);
    } on DioError catch (dioError) {
      switch (dioError.type) {
        case DioErrorType.RESPONSE:
          throw NetworkException(
              dioError.response.data["message"] == null
                  ? "An Unknown error occurred"
                  : dioError.response.data["message"],
              dioError.response.statusCode);
          break;
        case DioErrorType.DEFAULT:
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          throw NetworkException("Unable to connect to the internet.", 500);
          break;

        default:
          {
            throw NetworkException(
                "Unable to process request at the moment", 500);
          }
          break;
      }
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> postHttp(String route, dynamic body, dynamic headers) async {
    Response response;

    _log.fine('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await _dio.post(
        fullRoute,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
    } on DioError catch (dioError) {
      print(dioError.type);
      switch (dioError.type) {
        case DioErrorType.RESPONSE:
          throw NetworkException(
              dioError.response.data["message"] == null
                  ? "An Unknown error occurred"
                  : dioError.response.data["message"],
              dioError.response.statusCode);
          break;
        case DioErrorType.DEFAULT:
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          throw NetworkException("Unable to connect to the internet.", 500);
          break;

        default:
          {
            throw NetworkException(
                "Unable to process request at the moment", 500);
          }
          break;
      }
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future deleteHttp(String route, body, headers) async {
    Response response;

    _log.fine('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await _dio.delete(fullRoute,
          data: body,
          options: Options(
            headers: headers,
          ));
    } on DioError catch (dioError) {
      print(dioError.type);
      switch (dioError.type) {
        case DioErrorType.RESPONSE:
          throw NetworkException(
              dioError.response.data["message"] == null
                  ? "An Unknown error occurred"
                  : dioError.response.data["message"],
              dioError.response.statusCode);
          break;
        case DioErrorType.DEFAULT:
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
          throw NetworkException("Unable to connect to the internet.", 500);
          break;

        default:
          {
            throw NetworkException(
                "Unable to process request at the moment", 500);
          }
          break;
      }
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }
}