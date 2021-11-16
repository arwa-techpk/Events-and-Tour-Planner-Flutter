import 'dart:math';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/constants/constants_strings.dart';
import 'package:terhal/managers/connectionStatusSingleton.dart';


class Utils {

  static double degToRad(double degrees) {
    return (pi / 180) * degrees;
  }

  ///Hex to Color
  static Color hexToColor(String code) {
    return new Color(int.parse(code, radix: 16) + 0xFF000000);
  }

  static bool isNullOrEmptyList(List<dynamic> value) {
    try {
      if (value != null && value.length > 0) {
        return true;
      }
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static String getPrice(String price) {
    String mPrice = price != null
        && price != "0"
        && price.isNotEmpty
        ? price + " "
        "" : "";
    return mPrice;
  }

  static bool isDiscountedItem(String discount) {
    if (discount == null || discount == "0" || discount == "0.0" ||
        discount == "0.00" || discount.trim() == "") {
      return false;
    }
    return true;
  }

  static String getDiscountedValue(String price, String discount) {
    if (isDiscountedItem(discount)) {
      double mDiscount = 0.0;
      double original = double.parse(price);
      double discountPercentage = double.parse(discount);
      mDiscount = (original * discountPercentage) / 100;
      double result = original - mDiscount;
      return result.toStringAsFixed(2);
    }
    return price;
  }

  static bool isValidEmail(String email) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);

    return regExp.hasMatch(email);
  }

  static void showLoader() {
    if(Get.isDialogOpen !=null && !Get.isDialogOpen) {
      Get.dialog(Center(child: Container(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
               ConstantColor.primaryColor),))));
    }
  }

  static void hideLoader() {
    if(Get.isDialogOpen) {
      Navigator.pop(Get.context);
    }
  }

  static void checkInternet(Function callApi) async {
    bool isConnected =await ConnectionStatusSingleton.getInstance().isConnectedToInternet();
    if(isConnected) {
      callApi();
    }
    else {
      Get.snackbar(

         ConstantString.ALERT, ConstantString.INTERNET_NOT_AVAILABLE, colorText: ConstantColor.titleTextColor,
          backgroundColor: ConstantColor.snackBgColorError,
          isDismissible: false,
          duration: Duration(minutes: 1),
          mainButton: TextButton(child: Text(ConstantString.RETRY),onPressed: (){
            callApi();
          },),
          onTap: (GetBar getBar) {
            callApi();
            //getBar.dismiss();
          });
    }
  }

  static List getSpaceSplitValues(String value){
    int idx = value.indexOf(" ");
    List name = [value.substring(0,idx).trim(), value.substring(idx+1).trim()];
    return name;
  }
  
}
