// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/home/components/news_item.dart';
import 'package:ppid_mobile/modules/news/arguments/news_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/screens/news_detail_screen.dart';
import 'package:ppid_mobile/modules/news/screens/news_list_screen.dart';

enum NewsHorizontalListType {
  ppid,
  uin,
}

class NewsHorizontalList extends StatelessWidget {
  String title;
  List<dynamic> list;
  NewsHorizontalListType type;
  NewsHorizontalList({
    Key? key,
    required this.title,
    required this.list,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextWidget(
            title,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = list[index];

              if (type == NewsHorizontalListType.ppid) {
                return NewsItem(
                  imageUrl: item.postBanner ?? "",
                  title: item.postTitle ?? "",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "news-detail",
                      arguments: NewsDetailScreenArgument(
                        slug: item.postName,
                        type: NewsDetailType.ppid,
                      ),
                    );
                  },
                );
              } else {
                return NewsItem(
                  imageUrl: item.jetpackFeaturedMediaUrl!,
                  title: item.title!.rendered!,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "news-detail",
                      arguments: NewsDetailScreenArgument(
                        slug: item.slug,
                        type: NewsDetailType.uin,
                      ),
                    );
                  },
                );
              }
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 12);
            },
            itemCount: list.length,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                "news-list",
                arguments: NewsListScreenArgument(
                  type: type == NewsHorizontalListType.ppid
                      ? NewsListType.ppid
                      : NewsListType.uin,
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  "Lihat semua",
                  fontSize: 12,
                ),
                SizedBox(width: 6),
                SvgPicture.asset(
                  "assets/svgs/double_arrow_right.svg",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
