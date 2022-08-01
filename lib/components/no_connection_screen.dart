// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class NoConnectionScreen extends StatelessWidget {
  Function() onRefresh;
  NoConnectionScreen({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/no_connection.png"),
            SizedBox(height: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  "Tidak ada koneksi internet,",
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                ),
                TextWidget(
                  "periksa kembali koneksi internet anda",
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 4),
            RefreshComponent(onRefresh: onRefresh),
          ],
        ),
      ),
    );
  }
}
