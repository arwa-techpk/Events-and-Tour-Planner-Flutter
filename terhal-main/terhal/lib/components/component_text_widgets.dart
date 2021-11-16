import 'package:flutter/material.dart';

class ComponentText {
  static Widget buildTextWidget(
      {String title,
      TextAlign textAlign = TextAlign.start,
      TextOverflow overflow = TextOverflow.ellipsis,
      int maxLines = null,
      bool softWrap = false,
      Color color = Colors.black,
      double fontSize = 15.0,
      double height=1.2,
      FontWeight fontWeight = FontWeight.normal,
      TextDecoration textDecoration = TextDecoration.none}) {
    return Text(
      title??'',
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      
      softWrap: softWrap,
      style: TextStyle(
        decoration: textDecoration,
        color: color,
        height: height,
        fontSize: fontSize,
        fontFamily: 'padaloma.regular',
        fontWeight: fontWeight,
      ),
    );
  }
}
