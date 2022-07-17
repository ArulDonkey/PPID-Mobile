// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/circular_loading_widget.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class NewsListItem extends StatelessWidget {
  String title;
  String date;
  String imageUrl;
  Function()? onTap;
  NewsListItem({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl == ""
                  ? Image.asset(
                      "assets/images/image_placeholder.png",
                      width: 120,
                      height: 90,
                    )
                  : Image.network(
                      imageUrl,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loading) {
                        if (loading == null) {
                          return child;
                        }

                        return SizedBox(
                          width: 120,
                          height: 90,
                          child: CircularLoadingWidget(),
                        );
                      },
                    ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(
                        title,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextWidget(
                        date,
                        fontSize: 12,
                        color: Pallete.disabled,
                        maxLength: 10,
                      ),
                      SvgPicture.asset(
                        "assets/svgs/double_arrow_right.svg",
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
