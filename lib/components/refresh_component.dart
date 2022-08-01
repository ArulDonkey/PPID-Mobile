// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class RefreshComponent extends StatelessWidget {
  Function() onRefresh;
  RefreshComponent({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onRefresh,
        // borderRadius: BorderRadius.circular(60),
        child: Image.asset(
          "assets/images/refresh.png",
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
