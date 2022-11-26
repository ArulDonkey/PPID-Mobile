// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'base',
                        arguments: BaseScreenArgument(index: 2),
                        (route) => false,
                      );
                    },
                    contentPadding: EdgeInsets.all(8),
                    backgroundColor: Pallete.blue,
                    child: SvgPicture.asset('assets/svgs/kontak_ppid.svg'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: PrimaryButton(
                      onTap: () {
                        launchUrl(
                          Uri.parse('https://www.lapor.go.id/'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      contentPadding: EdgeInsets.all(5),
                      backgroundColor: Pallete.blue,
                      child: Image.asset('assets/images/lapor.png')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
