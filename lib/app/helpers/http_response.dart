/// class to send http responses from any API rest
class HttpResponse<T> {
  final HttpError? error;
  final T? data;
  HttpResponse({this.error, this.data});

  bool get hasError => (error != null);

  /// call to this method if the api request was successful
  static HttpResponse<T> success<T>(T data) => HttpResponse(
        error: null,
        data: data,
      );

  /// call to this method if the api request failed
  static HttpResponse<T> fail<T>(int statusCode, String message, dynamic data) => HttpResponse<T>(
        error: HttpError(statusCode, message, data),
        data: null,
      );
}

/// class to save the Http response error data
class HttpError extends HttpResponse {
  final int statusCode;
  final String message;
  final dynamic data;
  HttpError(this.statusCode, this.message, this.data);
}
