// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class LoadingWidget extends StatefulWidget {
  double? size;
  LoadingWidget({
    Key? key,
    this.size = 20,
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
        child: SpinKitThreeBounce(
          color: Pallete.blue,
          size: widget.size ?? 20,
        ),
      ),
    );
  }
}
