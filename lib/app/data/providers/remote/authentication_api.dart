import 'package:encuestop/app/data/models/user.dart';
import 'package:encuestop/app/data/providers/local/authentication_local.dart';
import 'package:encuestop/app/helpers/http.dart';
import 'package:encuestop/app/helpers/http_response.dart';
import 'package:get_storage/get_storage.dart';

/// class to make some authentication api calls like login, logout,password reset, refresh token, etc.
class AuthenticationAPI {
  final Http _http;
  final AuthenticationLocal _authenticationLocal;

  AuthenticationAPI(this._http, this._authenticationLocal);

  String get accessToken => _authenticationLocal.accessToken;

  /// simulates a login
  Future<HttpResponse<User>> loginByPassWord(
    String emailOrUsername,
    String password,
  ) async {
    String url = "/auth/local";
    final request = await _http.request(url,
        method: "POST",
        data: {"identifier": emailOrUsername, "password": password});

    if (request.error != null)
      return HttpResponse.fail<User>(
          request.error!.statusCode, request.error!.message, request.error!.data);


    var token = request.data['jwt'];
    GetStorage().write("token", token);

    return HttpResponse.success<User>  (
      User.fromJson(request.data['user']),
    );
  }

  /// simulates a register
  Future<HttpResponse<User>> register(Map<String,dynamic> data) async {
    String url = "/auth/local/register";
    final response =
        await this._http.request(url, method: "POST", data: data);
    if (response.hasError)
      return HttpResponse.fail<User>(response.error!.statusCode, response.error!.message, response.error!.data);

    var token = response.data['jwt'];
    GetStorage().write("token", token);

    var user = User.fromJson(response.data['user']);

    return HttpResponse.success<User>(user);
  }

  /// simulates a password reset
  Future<HttpResponse> requestPasswordResetLink(String email) async {
    await Future.delayed(Duration(seconds: 2));
    return HttpResponse.success(null);
  }

}
