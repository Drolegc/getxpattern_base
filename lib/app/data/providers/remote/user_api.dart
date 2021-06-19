
import 'package:dio/dio.dart';
import 'package:encuestop/app/data/models/user.dart';
import 'package:encuestop/app/helpers/http.dart';
import 'package:encuestop/app/helpers/http_response.dart';
import 'package:get_storage/get_storage.dart';

class UserApi {
  final Http _http;

  UserApi(this._http);

  Future<HttpResponse<User>> updateUserInfo(User user) async {

    final token = GetStorage().read("token");
    String url = "/users/me";
    final response = await this
        ._http
        .request(url, data: user.toJson(), accessToken: token, method: "PUT");

    if(response.hasError)
      return HttpResponse.fail<User>(response.error!.statusCode,response.error!.message,response.error!.data);

    return HttpResponse.success<User>(User.fromJson(response.data));
  }

  Future<HttpResponse<User>> requestUserData() async {
    final token = GetStorage().read("token");
    String url = "/users/me";
    final response = await this._http.request(url, accessToken: token);
    if (response.hasError)
      return HttpResponse.fail<User>(response.error!.statusCode,
          response.error!.message, response.error!.data);

    return HttpResponse.success<User>(User.fromJson(response.data));
  }

  Future<HttpResponse<User>> requestDataFromUser(String id) async {
    final token = GetStorage().read("token");
    String url = "/users/$id";
    final response = await this._http.request(url, accessToken: token);
    if (response.hasError)
      return HttpResponse.fail(response.error!.statusCode,
          response.error!.message, response.error!.data);

    return HttpResponse.success<User>(User.fromJson(response.data));
  }

  Future<HttpResponse<List<User>>> searchUser(String identifier) async {
    final token = GetStorage().read("token");
    String url = "/users?_where[_or][0][username_contains]=$identifier&_where[_or][1][email_contains]=$identifier&_where[_or][2][name_contains]=$identifier";
    final response = await this._http.request(url,accessToken: token);
    if(response.hasError)
      return HttpResponse.fail<List<User>>(response.error!.statusCode,
          response.error!.message, response.error!.data);

    return HttpResponse.success<List<User>>((response.data as List).map((user) => User.fromJson(user)).toList());
  }
}
