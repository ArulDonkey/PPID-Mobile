// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/home/components/news_item.dart';

class NewsSlider extends StatefulWidget {
  String title;
  int count;
  Function()? onTap;
  NewsSlider({
    Key? key,
    required this.title,
    required this.count,
    this.onTap,
  }) : super(key: key);

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextWidget(
            widget.title,
            fontSize: 12,
          ),
        ),
        // SizedBox(height: 12),
        Flexible(
          child: ListView.separated(
            // shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return NewsItem(
                imageUrl: "https://via.placeholder.com/500",
                title: "Berita",
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 12);
            },
            itemCount: widget.count,
          ),
        ),
        // SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            // onTap: () => log("test"),
            onTap: widget.onTap,
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
