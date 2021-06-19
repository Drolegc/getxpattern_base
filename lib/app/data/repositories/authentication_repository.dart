import 'package:encuestop/app/data/models/user.dart';
import 'package:encuestop/app/data/providers/remote/authentication_api.dart';
import 'package:encuestop/app/helpers/http_response.dart';
import 'package:get_storage/get_storage.dart';



/// implementation for the AuthenticationRepository
class AuthenticationRepository {
  final AuthenticationAPI _authenticationAPI;
  AuthenticationRepository(this._authenticationAPI);

  String get accessToken => _authenticationAPI.accessToken;

  Future<HttpResponse<User>> loginByPassWord(
    String emailOrUsername,
    String password,
  ) {
    return _authenticationAPI.loginByPassWord(emailOrUsername, password);
  }

  Future<HttpResponse<User>> register(Map<String,dynamic> data) {
    return _authenticationAPI.register(data);
  }

  Future<HttpResponse> requestPasswordResetLink(String email) {
    return _authenticationAPI.requestPasswordResetLink(email);
  }

  void logOut() {
    GetStorage().erase();
  }



}
