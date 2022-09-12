// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class DeleteLaterScreen extends StatelessWidget {
  const DeleteLaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: TextWidget(
            'Fitur ini masih dalam tahap pengembangan',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
