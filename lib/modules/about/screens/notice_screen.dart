// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final String _description =
      "“Dengan ini, kami menyatakan sanggup menyelenggarakan informasi publik sesuai standar yang telah diterapkan, dan apabila tidak menepati janji kami siap menerima sanksi sesuai peraturan perundang-undangan yang berlaku”";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(
      context: context,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            TextWidget(
              "Maklumat",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(height: 2),
            TextWidget(
              "Layanan Informasi Publik",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 12,
              ),
              child: Image.asset("assets/images/maklumat.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget("Maklumat Layanan Informasi Publik"),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 8,
                  ),
                  child: TextWidget(
                    _description,
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextWidget("Atasan PPID"),
                TextWidget("Prof. Dr. H. Mahmud, M.Si, CSEE"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
