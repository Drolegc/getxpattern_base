import 'package:encuestop/app/modules/admin_modules/admin_home/admin_home_binding.dart';
import 'package:encuestop/app/modules/admin_modules/admin_home/admin_home_view.dart';
import 'package:encuestop/app/modules/login/login_binding.dart';
import 'package:encuestop/app/modules/login/login_view.dart';
import 'package:encuestop/app/modules/participante_modules/participante_home/participante_home_binding.dart';
import 'package:encuestop/app/modules/participante_modules/participante_home/participante_home_view.dart';
import 'package:encuestop/app/modules/splash/splash_binding.dart';
import 'package:encuestop/app/modules/splash/splash_view.dart';

import 'package:encuestop/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashView(), binding: SplashBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
      name: Routes.PARTICIPANTE_HOME,
      page: () => ParticipanteHomeView(),
      binding: ParticipanteHomeBinding(),
    ),
    GetPage(
        name: Routes.ADMIN_HOME,
        page: () => AdminHomeView(),
        binding: AdminHomeBinding())
  ];
}
