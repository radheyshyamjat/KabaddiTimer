import 'package:flutter/widgets.dart';
class SizeConfig{
  static double screenWidth;
  static double screenHeight;
  static double blockSizeWidth = 0;
  static double blockSizeHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double widthMultiplier;
  static double heightMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
    blockSizeWidth = screenWidth/100;
    blockSizeHeight = screenHeight/100;
    textMultiplier = blockSizeHeight;
    imageSizeMultiplier = blockSizeWidth;
    heightMultiplier = blockSizeHeight;
    widthMultiplier = blockSizeWidth;
//    print('screen width : $screenWidth');
//    print('screen height : $screenHeight');
//    print('screen multiplier height : $heightMultiplier');
//    print('screen width multiplier : $widthMultiplier');
//    print('screen block height : $blockSizeHeight');
//    print('screen block width : $blockSizeWidth');
//    print('screen block text multiplyer : $textMultiplier');
  }
/*
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  //for safe area , by this you able to safe your area from notches with SafeArea widget
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 200;
    blockSizeVertical = screenHeight / 200;

    // for making safe area
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 200;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 200;
  }

*/

}