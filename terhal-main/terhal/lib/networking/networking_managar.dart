/* import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:terhal/helpers/utils.dart';
import 'package:terhal/models/base_model.dart';


class AppConfig {
  static String baseUrl = "https://projectresapi.azurewebsites.net";
  static String baseUrlProduction = "https://api.icabbicanada.com/v2/";
  static final String route = "/api/portal/";
}

enum HttpMethod { Get, Post, Put, Patch, Delete }
/* a */
class NetworkManager {

  List<Cookie> cookies = [];
  String cookie;
  static final NetworkManager _singleton = NetworkManager._internal();
  factory NetworkManager() {
    return _singleton;
  }
  NetworkManager._internal();

  Dio dio = Dio();
  void setDioOptions() {
    dio.options.contentType = Headers.jsonContentType;
  }

  Future<Response> callApi({
    @required HttpMethod method,
    @required String urlEndPoint,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Map<String, dynamic> body,
    bool isFormDataRequest = false,
    FormData formData,
    bool isLoading = true,
    bool isGetCookie = false,
  }) async {
    this.setDioOptions();

    EasyLoading.show();

    dio.interceptors
     
      ..add(LogInterceptor(requestBody: true, responseBody: true));
    var requestURL;
    requestURL = AppConfig.baseUrlProduction + AppConfig.route + urlEndPoint;
    

   dio.options.headers = {
        'Authorization':'Basic ZTYxZTc2OTJiOWY3OTk5MzE4ZGRmM2FhZDViMjhlODg0MzI1YWJkMzplNjU4YWUyODQ2ODY5NzQ2YTZiMDE2YjFjZWJlNmMyYTk3Yzg2ZTk0',
       
        //'Cookie': 'XDEBUG_SESSION=PHPSTORM'
      };
    Response response;
    try {
      if (isLoading) {
        Utils.showLoader();
      }
      switch (method) {
        case HttpMethod.Get:
          response = await dio.get(
            requestURL,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case HttpMethod.Post:
          response = await dio.post(
            requestURL,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: isFormDataRequest ? formData : body,
          );
          break;
        case HttpMethod.Put:
          response = await dio.put(
            requestURL,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: body,
          );
          break;
        case HttpMethod.Patch:
          break;
        case HttpMethod.Delete:
          response = await dio.delete(
            requestURL,
          );
          break;
      }
       Utils.hideLoader();
     // EasyLoading.dismiss();
      BaseModel baseModel = BaseModel.fromJson(response.data);
      if (baseModel.status == 200) {
        return response;
      } else {
        Fluttertoast.showToast(
            msg: baseModel.status.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return response;
      }
    } on DioError catch (error) {
       Utils.hideLoader();
      //EasyLoading.dismiss();
      Map<String, dynamic> errorResponse = error.response.data;

      Response errResponse =
          Response(data: errorResponse, statusCode: error.response.statusCode);
      return errResponse;
      // throw ApiException(error);
    }
  }
}
 */