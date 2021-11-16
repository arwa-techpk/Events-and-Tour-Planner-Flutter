import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double unitHeightValue;
  static double defaultSize;
  static double mobileBreakPoint=4.28;

 static  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    defaultSize = screenWidth * 0.024;
  }
  static bool isTablet(){
    return safeBlockHorizontal > mobileBreakPoint;
  }

  static double getFont(double size) {
    if (isTablet()) 
      return size + safeBlockHorizontal;
    return size;
  }
  static double getIconSize(double size) {
     if (isTablet()) 
      return size + safeBlockHorizontal;
    
    return size;
  }
static double getHeight(double inputHeight) {
   if (isTablet()) 
      return inputHeight +( safeBlockVertical*2);
    
    return inputHeight;
}
static double getWidth(double inputWidth) {
  if (isTablet()) 
      return inputWidth + (safeBlockHorizontal*4);
    
    return inputWidth;
} 
static double getMargin(double inputMargin) {
  if (isTablet()) 
      return inputMargin + (safeBlockHorizontal);
    
    return inputMargin;
} 
static double getSize(double size) {
  if (isTablet()) 
      return size + (safeBlockHorizontal);
    
    return size ;
} 
static int getGridCount() {
  if (isTablet()) 
      return 3;
    return 2;
} 


// Get the proportionate height as per screen size
/* static double getHeight(double inputHeight) {
  double screenHeight = screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
static double getWidth(double inputWidth) {
  double screenWidth = screenWidth;
  // 375 is the layout width that Figma provides
  return (inputWidth / 375.0) * screenWidth;
} */
}
