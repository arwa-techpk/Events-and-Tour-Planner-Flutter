
import 'package:get/get.dart';

import 'package:terhal/controllers/auth/auth_service.dart';


class LoginController extends GetxController {

 

  void login(String email, String password) async {
   
    try {
   //   await _authenticationController.signIn(email, password);
   //  Get.to(LoginScreen.id);
    } on AuthenticationException catch (e) {
      
    }
  }
}
