// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/circular_loading_widget.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class NewsItem extends StatelessWidget {
  String imageUrl;
  String title;
  Function()? onTap;
  NewsItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Pallete.componentShadow,
              offset: Offset(0, 5),
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: imageUrl == ""
                  ? Image.asset(
                      "assets/images/image_placeholder.png",
                      height: 90,
                      width: 200,
                    )
                  : Image.network(
                      imageUrl,
                      height: 90,
                      width: 200,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loading) {
                        if (loading == null) {
                          return child;
                        }

                        return SizedBox(
                          height: 90,
                          child: CircularLoadingWidget(),
                        );
                      },
                      errorBuilder: (context, obj, st) {
                        return SizedBox(
                          height: 90,
                          child: Image.asset(
                            "assets/images/unloaded_image.png",
                            width: 25,
                            height: 25,
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextWidget(
                title,
                fontSize: 12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
