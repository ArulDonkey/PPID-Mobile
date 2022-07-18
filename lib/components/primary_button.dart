// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class PrimaryButton extends StatefulWidget {
  Function() onTap;
  Widget child;
  Color? backgroundColor;
  EdgeInsetsGeometry? contentPadding;
  double? width;

  PrimaryButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.contentPadding,
    this.width,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            widget.backgroundColor ?? Pallete.navy,
          ),
          padding: MaterialStateProperty.all(widget.contentPadding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
