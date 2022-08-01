// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class ReportAbuseScreen extends StatefulWidget {
  const ReportAbuseScreen({Key? key}) : super(key: key);

  @override
  State<ReportAbuseScreen> createState() => _ReportAbuseScreenState();
}

class _ReportAbuseScreenState extends State<ReportAbuseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(context: context);
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextWidget(
                "Prosedur Pengaduan Penyalahgunaan dan Penyelenggaraan",
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            SvgPicture.asset("assets/svgs/report_abuse.svg"),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      // Navigator.pushNamed(context, "application-objection");
                    },
                    contentPadding: EdgeInsets.all(8),
                    backgroundColor: Pallete.lightGreen,
                    child: TextWidget(
                      "Ajukan Pengaduan melalui Kontak PPID",
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      // Navigator.pushNamed(context, "application-objection");
                    },
                    contentPadding: EdgeInsets.all(8),
                    backgroundColor: Pallete.lightGreen,
                    child: TextWidget(
                      "Ajukan Pengaduan melalui Portal lapor.go.id",
                      color: Colors.white,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
