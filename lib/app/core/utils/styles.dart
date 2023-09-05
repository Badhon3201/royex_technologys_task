import 'package:flutter/material.dart';
import 'package:royex_technologys_task/app/core/utils/reponsive_ui_service.dart';
import 'package:royex_technologys_task/app/core/values/color_manager.dart';

class TextStyles {
  static TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorManager.blackColor,
      fontSize: 18.sp);

  static TextStyle text16Style = TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorManager.blackColor,
      fontSize: 16.sp);

  static TextStyle hintStyle =
      TextStyle(fontWeight: FontWeight.w400, color: ColorManager.grayColor);

  static TextStyle grayBoldStyle =
      TextStyle(fontWeight: FontWeight.bold, color: ColorManager.grayColor);
}
