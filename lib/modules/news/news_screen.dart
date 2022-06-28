// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/modules/news/components/news_list_item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
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
    );
  }
}
