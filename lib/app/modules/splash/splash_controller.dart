import 'package:encuestop/app/data/models/role.dart';
import 'package:encuestop/app/data/services/authentication_controller.dart';
import 'package:encuestop/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  final _authenticationController = Get.find<AuthenticationController>();

  @override
  void onReady() {
    super.onReady();

    _init();
  }

  Future? _init(){
    final String token = _authenticationController.accessToken;
    if(token.isNotEmpty){
      //Chequear si el usuario logeado es participante o administrador
      switch(_authenticationController.user!.role.role){
        case RoleType.admin:
          //Enviar a home de Admin
          return Get.offNamed(Routes.ADMIN_HOME);
        case RoleType.authenticated:
          //Enviar a home de participante
          return Get.offNamed(Routes.PARTICIPANTE_HOME);
        case RoleType.public:
          // TODO: Handle this case.
          break;
      }

    }

    return Get.offNamed(Routes.LOGIN);
  }
}