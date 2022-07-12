// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class BackgroundedContainer extends StatelessWidget {
  Widget? child;
  BackgroundedContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: child,
    );
  }
}
