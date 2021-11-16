// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

class LoginRequestModel {
  LoginRequestModel({
    this.companyID,
    this.driverID,
    this.vehicleID
  });

  String companyID;
  String driverID;
  String vehicleID;

  

  
}
