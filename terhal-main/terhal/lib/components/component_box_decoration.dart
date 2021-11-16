import 'package:flutter/material.dart';

class ComponentBoxDecoration {
  static roundedRectangleBorder(
      {Color color = Colors.transparent, double radius = 5.0}) {
    return RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(radius),
      side: BorderSide(color: color),
    );
  }
}

