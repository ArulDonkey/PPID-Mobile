// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class ErrorScreen extends StatelessWidget {
  Function() onRefresh;
  ErrorScreen({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/error.png"),
          TextWidget(
            "Terjadi kesalahan, silahkan muat ulang",
            textAlign: TextAlign.center,
            color: Pallete.darkGrey,
          ),
          RefreshComponent(onRefresh: onRefresh),
        ],
      ),
    );
  }
}
