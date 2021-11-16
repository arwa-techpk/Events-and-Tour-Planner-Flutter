import 'package:flutter/material.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/utils/size_config.dart';

class ComponentButton {
  static Widget buildButton({
    String title = '',
    Function onPressed,
    double height = 44.0,
    double width = 200.0,
    Color btnColor = ConstantColor.primaryColorDark,
    Color texColor = Colors.white,
    Color borderColor = Colors.white,
    double radius = 38.0,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                color: texColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.getFont(14.0)),
          ),
        ),
      ),
    );
  }

  static Widget buildTransparentButton({
    String title,
    Function onPressed,
    double height = 44.0,
    double width = 140.0,
    Color btnColor = Colors.transparent,
    Color texColor = Colors.black,
    Color borderColor = Colors.grey,
    double radius,
    double fontsize,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(color: borderColor.withOpacity(0.3), width: 2.0),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: texColor,
                fontWeight: FontWeight.bold,
                fontSize: fontsize),
          ),
        ),
      ),
    );
  }

  static Widget buildRoundedSocialButton(
      {String imagePath, String title, Function onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border:
                Border.all(width: 1.0, color: Colors.grey.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }

  static Widget buildRoundedFbButton(
      {String imagePath, String title, Function onPressed}) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      color: Colors.blue,
    );
  }
}
