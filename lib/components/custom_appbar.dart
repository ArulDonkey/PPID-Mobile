// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

AppBar customAppBar({
  required BuildContext context,
  bool backButton = true,
  Widget? leading,
  Widget? title,
  List<Widget>? actions,
  double elevation = 0,
  Color backgroundColor = Pallete.bw,
  bool centerTitle = false,
  SystemUiOverlayStyle? systemUiOverlayStyle,
}) {
  return AppBar(
    leading: backButton
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(60),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        : leading,
    title: title,
    actions: actions,
    elevation: elevation,
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    systemOverlayStyle: systemUiOverlayStyle,
  );
}
