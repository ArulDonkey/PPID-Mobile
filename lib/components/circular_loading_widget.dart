// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class CircularLoadingWidget extends StatefulWidget {
  double? size;
  double? verticalPadding;
  CircularLoadingWidget({
    Key? key,
    this.size = 20,
    this.verticalPadding = 16,
  }) : super(key: key);

  @override
  State<CircularLoadingWidget> createState() => _CircularLoadingWidgetState();
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalPadding ?? 16.0,
      ),
      child: Center(
        child: SpinKitCircle(
          color: Pallete.blue,
          size: widget.size ?? 20,
        ),
      ),
    );
  }
}
