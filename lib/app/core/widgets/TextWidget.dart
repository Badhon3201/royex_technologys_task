import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool? softWrap;
  final TextDecoration? decoration;
  final int? maxLine;
  final double? lineHeight;
  final bool isForceDarkMode;
  final TextStyle? textStyle;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.textOverflow,
      this.softWrap,
      this.decoration,
      this.maxLine,
      this.lineHeight,
      this.isForceDarkMode = true,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: textOverflow,
      maxLines: maxLine ?? 100,
      style: textStyle ??
          TextStyle(
            height: lineHeight,
            decoration: decoration ?? TextDecoration.none,
            color: isForceDarkMode ? textColor : textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}
