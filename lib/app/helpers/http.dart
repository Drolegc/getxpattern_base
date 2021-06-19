import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'http_response.dart';

/// class to handle every API request
class Http {
  final Dio _dio;

  /// [logs] if is true print the logs in console
  final bool logs;

  /// to print logs
  final _logger = Logger();

  /// constructor
  Http(this._dio, {this.logs = false});

  /// methos to handle an API RESQUEST
  ///
  /// [path] the path or the complete api url endpoint
  /// [method] GET,POST,PUT,DELETE
  /// [queryParameters]
  /// [data] body data
  /// [headers] request headers
  /// [accessToken] for api authentication
  /// [parser] callback to convert the response data
  /// [cancelToken] to cancel the request
  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
        FormData? formData,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,
    CancelToken? cancelToken,
    String? accessToken,
  }) async {
    try {
      Map<String, String>? headersToSend;

      if (accessToken != null) {
        headersToSend = {
          'Authorization': "Bearer " + accessToken,
        };
      }

      if (headers != null) {
        headersToSend = (headersToSend != null) ? {...headers, ...headersToSend} : headers;
      }

      final Response response = await _dio.request(
        path,
        data: data ?? formData,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headersToSend,
        ),
        cancelToken: cancelToken,
      );

      if (parser == null) {
        return HttpResponse.success<T>(response.data);
      } else {
        return HttpResponse.success<T>(parser(response.data));
      }
    } catch (e, s) {
      if (this.logs) {
        _logger.e("request failed to $path", e, s);
      }
      int statusCode = 0;
      String message = "internal error";
      dynamic data;
      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          if (logs) {
            _logger.e(e.response?.data);
          }
          statusCode = e.response?.statusCode ?? 0;
          message = e.response?.statusMessage ?? "internal error";
          data = e.response?.data ?? {};
        }
      }
      return HttpResponse.fail<T>(
        statusCode,
        message,
        data,
      );
    }
  }
}
