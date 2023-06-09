// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class VisiMisiScreen extends StatefulWidget {
  const VisiMisiScreen({Key? key}) : super(key: key);

  @override
  State<VisiMisiScreen> createState() => _VisiMisiScreenState();
}

class _VisiMisiScreenState extends State<VisiMisiScreen> {
  int i = 0;
  int j = 0;

  final List<String> misiContents = [
    "Mengelola informasi dan dokumentasi berdasarkan Undang Undang Nomor 14 Tahun 2018",
    "Memberikan layanan informasi dan dokumentasi secara profesional, adil, transparan dan akuntabel",
    "Mendukung visi dan misi Universitas Islam Negeri Sunan Gunung Djati Bandung",
  ];

  final List<String> tujuanContents = [
    "Memberikan pelayanan informasi dan dokumentasi yang prima",
    "Memberikan kemudahan kepada publik dalam mendapatkan informasi yang diperlukan dengan murah dan sederhana",
    "Menyediakan dan memberikan informasi publik yang dikuasai secara akurat, benar dan tidak menyesatkan",
    "Menyiapkan petugas informasi yang berdedikasi dan siap melayani",
  ];

  final List<Color> numberColors = [
    Pallete.yellow,
    Pallete.lightGreen,
    Pallete.blue,
    Pallete.yellow,
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
          horizontal: 16,
        ),
        child: Column(
          children: [
            _buildVisi(),
            _buildMisi(),
            _buildTujuan(),
          ],
        ),
      ),
    );
  }

  Widget _buildVisi() {
    return Column(
      children: [
        TextWidget(
          "Visi PPID",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        SizedBox(height: 2),
        TextWidget(
          "UIN Sunan Gunung Djati Bandung",
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: _buildVisiContainer(),
        ),
      ],
    );
  }

  Widget _buildMisi() {
    return Column(
      children: [
        TextWidget(
          "Misi PPID",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        SizedBox(height: 2),
        TextWidget(
          "UIN Sunan Gunung Djati Bandung",
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: _buildSlider(type: 1),
        ),
      ],
    );
  }

  Widget _buildTujuan() {
    return Column(
      children: [
        TextWidget(
          "Tujuan PPID",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        SizedBox(height: 2),
        TextWidget(
          "UIN Sunan Gunung Djati Bandung",
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: _buildSlider(),
        ),
      ],
    );
  }

  Widget _buildVisiContainer() {
    const String text =
        "“Menjadi lembaga publik informatif pada tahun 2023 sebagai wujud implementasi visi Universitas Islam Negeri Sunan Gunung Djati Bandung.”";

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        color: Pallete.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextWidget(
        text,
        color: Colors.white,
        textAlign: TextAlign.center,
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildMisiContainer({
    required String text,
    required Color numberColor,
    required int number,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 3),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: numberColor,
            ),
            child: Center(
              child: TextWidget(
                "$number",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 8),
          TextWidget(
            text,
            textAlign: TextAlign.center,
            fontSize: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildSlider({int? type}) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: type != null ? misiContents.length : tujuanContents.length,
          itemBuilder: (context, index, pageViewIndex) {
            // log(tujuanContents[index]);
            return Container(
              margin: EdgeInsets.all(8),
              child: _buildMisiContainer(
                text: type == 1 ? misiContents[index] : tujuanContents[index],
                numberColor: numberColors[index],
                number: index + 1,
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                if (type == 1) {
                  i = index;
                } else {
                  j = index;
                }
              });

              log('$j');
            },
          ),
        ),
        SizedBox(height: 8),
        CarouselIndicator(
          count: type == 1 ? misiContents.length : tujuanContents.length,
          width: 8,
          height: 8,
          index: type == 1 ? i : j,
          activeColor: Pallete.blue,
          color: Pallete.disabled,
        ),
      ],
    );
  }
}
