// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class BackgroundedContainer extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  BackgroundedContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: child,
    );
  }
}
