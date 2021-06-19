/// class to handle the local authentication like get an access token, refresh tokens, clear the session data,etc
import 'package:get_storage/get_storage.dart';
class AuthenticationLocal {
  String get accessToken {
    String token = GetStorage().read("token") ?? ""; //If token it is an empty string, the user is not logged in
    return token;
  }
}
