
import 'package:encuestop/app/data/models/user.dart';
import 'package:encuestop/app/data/repositories/authentication_repository.dart';
import 'package:encuestop/app/data/repositories/user_repository.dart';
import 'package:encuestop/app/helpers/http_response.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController{

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  User? _user;
  User? _auxDataUser;

  User? get user => this._user;

  String get accessToken => _authenticationRepository.accessToken;

  AuthenticationController(this._authenticationRepository,this._userRepository);

  Future<void> initUserData() async {
    if(accessToken.isNotEmpty)
      await this.currentUserRefreshData();
  }

  Future<void> currentUserRefreshData() async {
    var value = await this._userRepository.requestMyData();
    _user = (!value.hasError) ? value.data : null;
    _auxDataUser = _user;
  }

  // Authentication functions

  Future<HttpResponse<User>> loginByPassWord(
      String emailOrUsername,
      String password,
      ) async {
    final response = await _authenticationRepository.loginByPassWord(emailOrUsername, password);
    if(!response.hasError) {
      _user = response.data;
      _auxDataUser = response.data;
    }
    return response;
  }

  Future<HttpResponse> requestPasswordResetLink(String email) {
    return _authenticationRepository.requestPasswordResetLink(email);
  }

  // User functions

  void onEmailChange(String email){
    _auxDataUser?.email = email;
  }

  Future<HttpResponse<User>> saveUserData() async {
    if(_auxDataUser == null){
      return HttpResponse.fail<User>(0, "No se especifico el usuario", "");
    }
    final response = await _userRepository.updateDataUser(_auxDataUser!);
    if(!response.hasError)
      _user = response.data;
    return response;
  }

  void logOut() {
    _user = null;
    _authenticationRepository.logOut();
  }



}