// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/loading.png"),
          LoadingWidget(size: 50),
          TextWidget("Tunggu sebentar"),
        ],
      ),
    );
  }
}
