// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class UnderConstructionScreen extends StatefulWidget {
  const UnderConstructionScreen({super.key});

  @override
  State<UnderConstructionScreen> createState() =>
      _UnderConstructionScreenState();
}

class _UnderConstructionScreenState extends State<UnderConstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(context: context);
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 72),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/under_construction.svg'),
            SizedBox(height: 30),
            TextWidget(
              'Fitur ini masih dalam tahap pengembangan',
              textAlign: TextAlign.center,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
