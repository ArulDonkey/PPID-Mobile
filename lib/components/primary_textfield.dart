// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class PrimaryTextField extends StatefulWidget {
  TextEditingController? controller;
  String? initialValue;
  Widget? icon;
  String? hintText;
  bool? isPassword;
  int? minLines;
  int? maxLines;
  int? maxLength;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  PrimaryTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.icon,
    this.hintText,
    this.isPassword,
    this.minLines,
    this.maxLines,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: Pallete.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          icon: widget.icon,
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: widget.suffixIcon,
        ),
        obscureText: widget.isPassword ?? false,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        validator: widget.validator,
      ),
    );
  }
}
