import 'package:encuestop/app/modules/home/home_binding.dart';
import 'package:encuestop/app/modules/home/home_view.dart';
import 'package:encuestop/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name:Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding()
    )
  ];

}