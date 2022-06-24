// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class HomeCard extends StatelessWidget {
  String iconUrl;
  String title;
  String description;
  HomeCard({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildWhiteContainer(),
        Positioned(
          top: -20,
          left: -10,
          child: _buildBlueContainer(),
        ),
        // _buildBlueContainer(),
      ],
    );
  }

  Widget _buildWhiteContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: Offset(0, 10),
            spreadRadius: .1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          TextWidget(
            title,
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),
          TextWidget(
            description,
            fontSize: 11,
          ),
        ],
      ),
    );
  }

  Widget _buildBlueContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: Offset(0, 5),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Transform.scale(
        scale: .6,
        child: SvgPicture.asset(
          iconUrl,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
