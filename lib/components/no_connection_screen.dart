// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class NoConnectionScreen extends StatelessWidget {
  String? svgUrl;
  String? description;
  Function() onRefresh;
  NoConnectionScreen({
    Key? key,
    this.svgUrl,
    this.description,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          svgUrl != null ? SvgPicture.asset(svgUrl!) : Container(),
          SizedBox(height: 4),
          TextWidget(
            description ?? "",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          ElevatedButton(
            onPressed: onRefresh,
            child: TextWidget("Muat ulang"),
          ),
        ],
      ),
    );
  }
}