// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class Carousel extends StatefulWidget {
  // List<String> imageUrls;
  int? index;
  Carousel({
    Key? key,
    // required this.imageUrls,
    this.index,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, pageViewIndex) {
            return Image.asset(
              "assets/images/carousel_dummy.png",
              fit: BoxFit.cover,
            );
          },
          options: CarouselOptions(
            viewportFraction: .68,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                widget.index = index;
              });
            },
          ),
        ),
        // SizedBox(height: 10),
        CarouselIndicator(
          count: 3,
          index: widget.index,
          activeColor: Pallete.blue,
          color: Pallete.disabled,
        ),
      ],
    );
  }
}
