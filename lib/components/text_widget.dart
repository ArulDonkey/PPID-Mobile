// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  late String text;
  Color color;
  double? fontSize;
  FontWeight? fontWeight;
  TextDecoration? decoration;
  String? fontFamily;
  TextOverflow? overflow;
  bool? isUnderlined;
  TextAlign? textAlign;
  TextWidget(
    this.text, {
    Key? key,
    this.color = Colors.black,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.fontFamily,
    this.overflow,
    this.isUnderlined,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
        overflow: overflow,
      ),
    );
  }
}
