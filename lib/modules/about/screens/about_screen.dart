// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/about/arguments/about_webview_screen_argument.dart';
import 'package:ppid_mobile/modules/information/components/information_item.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
    var i = 0;

    final List<String> containerContents = [
      "Profil PPID UIN SGD",
      "Maklumat",
      "Visi dan Misi",
      "Tugas dan Kewajiban",
      "Struktur Organisasi",
      "Regulasi",
    ];

    final List<Color> containerColors = [
      Pallete.yellow,
      Pallete.lightGreen,
      Pallete.blue,
    ];

    return BackgroundedContainer(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
              child: TextWidget(
                "Tentang Kami",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (i > 2) {
                  i = 0;
                }

                return InformationItem(
                  type: InformationItemType.primary,
                  content: containerContents[index],
                  numberPrimary: index + 1,
                  primaryContainerColor: containerColors[i++],
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, "ppid-profile");
                    }

                    if (index == 1) {
                      Navigator.pushNamed(context, "notice");
                    }

                    if (index == 2) {
                      Navigator.pushNamed(context, "visi-misi");
                    }

                    if (index == 3) {
                      Navigator.pushNamed(
                        context,
                        "about-webview",
                        arguments: AboutWebviewScreenArgument(
                          "https://ppid.uinsgd.ac.id/tugas-fungsi",
                        ),
                      );
                    }

                    if (index == 4) {
                      Navigator.pushNamed(
                        context,
                        "about-webview",
                        arguments: AboutWebviewScreenArgument(
                          "https://ppid.uinsgd.ac.id/struktur-organisasi",
                        ),
                      );
                    }

                    if (index == 5) {
                      Navigator.pushNamed(context, "regulation");
                    }
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
