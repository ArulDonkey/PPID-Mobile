// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/information/arguments/information_list_screen_argument.dart';
import 'package:ppid_mobile/modules/information/components/information_item.dart';
import 'package:ppid_mobile/modules/information/screens/information_list_screen.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/screens/news_list_screen.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
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
      centerTitle: true,
      title: Image.asset(
        "assets/images/ppid_logo.png",
        width: 55,
      ),
    );
  }

  Widget _buildBody() {
    var i = 0;
    final List<Color> containerColors = [
      Pallete.yellow,
      Pallete.lightGreen,
      Pallete.blue,
    ];

    final List<String> containerContents = [
      "Informasi Wajib Berkala",
      "Informasi Wajib Tersedia Setiap Saat",
      "Informasi Wajib Diumumkan Serta Merta",
      "Berita Terbaru",
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
                "Informasi Publik",
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
                    if (index == 3) {
                      Navigator.pushNamed(
                        context,
                        "news-list",
                        arguments: NewsListScreenArgument(
                          type: NewsListType.ppid,
                        ),
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        "information-list",
                        arguments: InformationListScreenArgument(
                          type: InformationListType.values[index],
                        ),
                      );
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
