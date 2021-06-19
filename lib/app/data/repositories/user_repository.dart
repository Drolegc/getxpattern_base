
import 'package:encuestop/app/data/models/user.dart';
import 'package:encuestop/app/data/providers/remote/user_api.dart';
import 'package:encuestop/app/helpers/http_response.dart';


class UserRepository {

  final UserApi _userApi;
  UserRepository(this._userApi);

  Future<HttpResponse<User>> requestMyData() => _userApi.requestUserData();
  Future<HttpResponse<User>> updateDataUser(User user) => _userApi.updateUserInfo(user);
}