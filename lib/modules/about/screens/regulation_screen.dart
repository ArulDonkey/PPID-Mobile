// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:url_launcher/url_launcher.dart';

class RegulationScreen extends StatefulWidget {
  const RegulationScreen({Key? key}) : super(key: key);

  @override
  State<RegulationScreen> createState() => _RegulationScreenState();
}

class _RegulationScreenState extends State<RegulationScreen> {
  final List<String> _containerContents = [
    'Peraturan Tentang Keterbukaan Informasi Publik',
    'Rancangan Peraturan Keterbukaan Informasi Publik',
    'Peraturan Tentang Keterbukaan Informasi Publik di UIN Sunan Gunung Djati Bandung',
  ];

  final List<String> _urls = [
    'https://ppid.uinsgd.ac.id/regulasi',
    'https://ppid.uinsgd.ac.id/regulasi2',
    'https://ppid.uinsgd.ac.id/regulasi3'
  ];

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
          vertical: 32,
          horizontal: 24,
        ),
        child: Column(
          children: [
            TextWidget(
              "Regulasi",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(height: 40),
            ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildContainer(
                  text: _containerContents[index],
                  onTap: () {
                    launchUrl(
                      Uri.parse(_urls[index]),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: _containerContents.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({
    required String text,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Pallete.componentShadow,
              offset: Offset(0, 3),
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: TextWidget(
                text,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 14),
            SvgPicture.asset('assets/svgs/chevron_right.svg'),
          ],
        ),
      ),
    );
  }
}
