// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/information/components/information_item.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
      backButton: false,
    );
  }

  Widget _buildBody() {
    // var i = 0;
    final List<Color> containerColors = [
      Pallete.yellow,
      Pallete.lightGreen,
      Pallete.blue,
    ];

    final List<String> containerContents = [
      "Prosedur Permohonan Informasi",
      "Prosedur Pengajuan Keberatan",
      "Prosedur Pengajuan Penyalahgunaan dan Penyelenggaraan",
    ];

    final List<String> screens = [
      "request-information-procedure",
      "request-complaint-procedure",
      "report-abuse",
    ];

    return BackgroundedContainer(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
              child: TextWidget(
                "Layanan Informasi",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InformationItem(
                  type: InformationItemType.primary,
                  numberPrimary: index + 1,
                  primaryContainerColor: containerColors[index],
                  content: containerContents[index],
                  onTap: () {
                    Navigator.pushNamed(context, screens[index]);
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 24),
              itemCount: containerContents.length,
            ),
          ],
        ),
      ),
    );
  }
}
