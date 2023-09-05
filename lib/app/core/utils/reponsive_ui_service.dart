import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveUIService {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double originalWidth = 0;
  static double originalHeight = 0;
  static BuildContext? buildContext;

  void init(Size designSize, BuildContext context) {
    buildContext = context;
    screenWidth = MediaQuery.of(buildContext!).size.width;
    screenHeight = MediaQuery.of(buildContext!).size.height;
    originalWidth = designSize.width;
    originalHeight = designSize.height;
  }

  static double scaleWidth() {
    return screenWidth / originalWidth;
  }

  static double scaleHeight() {
    return screenHeight / originalHeight;
  }

  static double setWidth(num width) {
    return width * scaleWidth();
  }

  static double setHeight(num height) {
    return height * scaleHeight();
  }

  static double setRadius(num radius) {
    return radius * min(scaleWidth(), scaleHeight());
  }

  static double setSp(num fontSize) {
    return fontSize * min(scaleWidth(), scaleHeight());
  }

  static bool isBottomSafeArea() {
    if (getBottomNotchHeight() > 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTopSafeArea() {
    if (getTopNotchHeight() > 0) {
      return true;
    } else {
      return false;
    }
  }

  static double getTopNotchHeight() {
    return MediaQuery.of(buildContext!).viewPadding.top;
  }

  static double getBottomNotchHeight() {
    return MediaQuery.of(buildContext!).viewPadding.bottom;
  }
}

extension ReponsiveSize on num {
  //using for width
  double get w => ResponsiveUIService.setWidth(this);

  //using for height
  double get h => ResponsiveUIService.setHeight(this);

  //using for radius
  double get r => ResponsiveUIService.setRadius(this);

  //using for adaptive font size
  double get sp => ResponsiveUIService.setSp(this);

  double get sm => min(toDouble(), sp);
}
