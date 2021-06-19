import 'package:dio/dio.dart';
import 'package:encuestop/app/data/providers/local/authentication_local.dart';
import 'package:encuestop/app/data/providers/remote/authentication_api.dart';
import 'package:encuestop/app/data/providers/remote/user_api.dart';
import 'package:encuestop/app/data/repositories/authentication_repository.dart';
import 'package:encuestop/app/data/repositories/user_repository.dart';
import 'package:encuestop/app/data/services/authentication_controller.dart';
import 'package:encuestop/app/helpers/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';


/// class to inject the necessary dependecies for all project
abstract class DependencyInjection {
  static Future<void> initialize() async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env["IP"] ?? ""));
    final http = Http(dio, logs: true);

    // providers
    final authenticationLocal = AuthenticationLocal();
    final authenticationAPI = AuthenticationAPI(http,authenticationLocal);
    final userApi = UserApi(http);

    // repositories
    final authenticationRepository = AuthenticationRepository(authenticationAPI);
    final userRepository = UserRepository(userApi);

    //Global controller
    final authenticationController = AuthenticationController(authenticationRepository,userRepository);
    await authenticationController.initUserData();

    // injection
    Get.put<AuthenticationController>(authenticationController);
  }
}
