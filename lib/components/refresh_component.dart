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
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: IconButton(
          onPressed: onRefresh,
          icon: Icon(
            Icons.refresh,
            size: 30,
          ),
        ),
      ),
    );
  }
}
