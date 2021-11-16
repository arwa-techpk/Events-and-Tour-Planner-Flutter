import 'package:flutter/material.dart';

class ComponentSizedBox{
  static Widget topMargin({double size}){
    return SizedBox(height: size,);
    
  }
   static Widget sideMargin({double size}){
    return SizedBox(width: size,);
    
  }
}