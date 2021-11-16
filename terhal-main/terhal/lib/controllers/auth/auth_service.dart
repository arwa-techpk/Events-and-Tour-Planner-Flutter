import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';
import 'package:terhal/constants/api_end_points.dart';
import 'package:terhal/models/login_request_model.dart';
import 'package:terhal/models/user_model.dart';
import 'package:terhal/networking/networking_managar.dart';

abstract class AuthenticationRepo extends GetxService {
  Future<UserModel> getCurrentUser();
 // Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationRepo {
  LoginRequestModel loginRequestModel;
  @override
  Future<UserModel> getCurrentUser() async {
    // simulated delay
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

 /*  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    loginRequestModel = new LoginRequestModel();
    loginRequestModel.username = email;
    loginRequestModel.password = password;
    dio.Response response = (await NetworkManager().callApi(
      method: HttpMethod.Post,
      urlEndPoint: ApiEndPoint.apiEndPointLogIn,
      isFormDataRequest: false,
      body: loginRequestModel.toJson(),
    ));

    return UserModel.fromJson(response.data);
  } */

  @override
  Future<void> signOut() {
    return null;
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
