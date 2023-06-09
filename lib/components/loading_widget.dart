// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  double? size;
  Color? color;
  LoadingWidget({
    Key? key,
    this.size = 40,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Image.asset(
          'assets/gifs/loading.gif',
          width: widget.size,
        ),
        // child: SpinKitThreeBounce(
        //   color: widget.color ?? Colors.black,
        //   size: widget.size ?? 20,
        // ),
      ),
    );
  }
}
