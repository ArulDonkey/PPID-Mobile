// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/components/news_list_item.dart';

enum NewsListType {
  uin,
  ppid,
}

class NewsListScreen extends StatefulWidget {
  NewsListScreenArgument? argument;
  NewsListScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late String title;

  @override
  void initState() {
    if (widget.argument!.type == NewsListType.ppid) {
      title = "Berita PPID UIN Sunan Gunung Djati Bandung";
    } else {
      title = "Berita UIN Sunan Gunung Djati Bandung";
    }

    super.initState();
  }

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
      title: Image.asset(
        "assets/images/ppid_logo.png",
        width: 60,
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
              child: TextWidget(
                title,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            ListView.separated(
              primary: false,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsListItem(
                  title: "title",
                  description: "description",
                  date: "date",
                  imageUrl: "https://via.placeholder.com/500",
                  onTap: () {
                    Navigator.pushNamed(context, "news-detail");
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount: 20,
            ),
          ],
        ),
      ),
    );
  }
}
