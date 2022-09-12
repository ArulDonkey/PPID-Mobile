// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class HomeCard extends StatelessWidget {
  String iconUrl;
  String title;
  String description;
  Function()? onTap;
  HomeCard({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildWhiteContainer(),
          Positioned(
            top: -23,
            left: 22,
            right: 22,
            child: _buildBlueContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteContainer() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 55,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Pallete.componentShadow,
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
                fontSize: 10,
              ),
              TextWidget(
                description,
                fontSize: 10,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 30,
          left: 30,
          child: Container(
            height: 1,
            width: 40,
            color: Pallete.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildBlueContainer() {
    return Container(
      width: 55,
      height: 55,
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
