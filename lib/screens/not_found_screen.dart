import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget("Halaman tidak ditemukan"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
