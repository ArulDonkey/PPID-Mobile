// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

enum InformationItemType {
  primary,
  secondary,
}

class InformationItem extends StatelessWidget {
  InformationItemType type;
  int? numberPrimary;
  String content;
  Color? primaryContainerColor;
  String? secondaryNumber;
  Function()? onTap;
  Widget? subInformations;
  InformationItem({
    Key? key,
    required this.type,
    this.numberPrimary,
    required this.content,
    this.primaryContainerColor,
    this.onTap,
    this.secondaryNumber,
    this.subInformations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == InformationItemType.primary) {
      return _buildPrimary();
    } else {
      return _buildSecondary();
    }
  }

  Widget _buildPrimary() {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: _buildContainerPrimary(),
          ),
          _buildNumberPrimary(
            number: numberPrimary ?? 0,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPrimary({required int number}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: primaryContainerColor ?? Pallete.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextWidget(
          "$number",
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContainerPrimary() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 3),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextWidget(
              content,
              fontSize: 10,
              maxLines: 2,
            ),
          ),
          SvgPicture.asset(
            "assets/svgs/chevron_right.svg",
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSecondary() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 0, 24, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Pallete.componentShadow,
              offset: Offset(0, 5),
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Pallete.blue,
                ),
              ),
            ),
            Flexible(
              flex: 20,
              child: Padding(
                padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                child: Row(
                  children: [
                    Flexible(
                      child: TextWidget(
                        "$secondaryNumber",
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      flex: 10,
                      child: TextWidget(
                        content,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: SvgPicture.asset("assets/svgs/chevron_right.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
