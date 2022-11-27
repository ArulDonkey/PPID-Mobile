// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCenterScreen extends StatefulWidget {
  const CallCenterScreen({Key? key}) : super(key: key);

  @override
  State<CallCenterScreen> createState() => _CallCenterScreenState();
}

class _CallCenterScreenState extends State<CallCenterScreen> {
  final PpidSharedPreferences _preferences = PpidSharedPreferences();
  User? _user;

  @override
  void initState() {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) async {
    getCurrentUser();
    // });
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
      backButton: false,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
              child: TextWidget(
                "Form Informasi Publik",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            _user != null
                ? Container()
                : Column(
                    children: [
                      _buildFirstContainer(),
                      SizedBox(height: 40),
                    ],
                  ),
            Column(
              children: [
                _buildThirdContainer(),
                SizedBox(height: 40),
              ],
            ),
            _buildSecondContainer(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstContainer() {
    final List<String> contents = [
      'Permohonan Informasi',
      'Pengajuan Keberatan',
      'Pengaduan Penyalahgunaan dan pelanggaran',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
          TextWidget(
            'Untuk melakukan:',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 32),
          Column(
            children: List.generate(contents.length, (index) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBlueDot(),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextWidget(
                      contents[index],
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: 'Silahkan ',
              style: TextStyle(
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'masuk ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'atau ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'daftar ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'terlebih dahulu',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                text: 'Masuk',
                onTap: () {
                  Navigator.pushNamed(context, 'sign-in');
                },
              ),
              SizedBox(width: 24),
              _buildButton(
                text: 'Daftar',
                onTap: () {
                  Navigator.pushNamed(context, 'sign-up');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required Function() onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Pallete.blue,
        ),
        child: TextWidget(
          text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBlueDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Pallete.blue,
      ),
    );
  }

  Widget _buildThirdContainer() {
    final List<String> firstSchedule = [
      'Senin - Kamis',
    ];
    final List<String> secondSchedule = [
      "Jum'at",
    ];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 5),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextWidget(
              'Jam Layanan',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Pelayanan langsung di kantor layanan\ninformasi publik',
            style: TextStyle(
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: List.generate(firstSchedule.length, (index) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBlueDot(),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextWidget(
                      firstSchedule[index],
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: const TextSpan(
                      text: '08.00 - 11.30 WIB\n13.00 - 16.00 WIB',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                ),
              ),
            ],
          ),
          Column(
            children: List.generate(secondSchedule.length, (index) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBlueDot(),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextWidget(
                      secondSchedule[index],
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: const TextSpan(
                      text: '08.30 - 11.00 WIB\n13.00 - 16.00 WIB',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecondContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 5),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextWidget(
              'Kontak kami',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await openUrl(
                          'https://maps.app.goo.gl/yTCdWC35vpcYkkxv6?g_st=ic');
                    },
                    icon: SvgPicture.asset(
                      'assets/svgs/map_pin.svg',
                      color: Colors.blue,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 14),
                  Flexible(
                    child: TextWidget(
                        'Jl. A.H. Nasution No. 105A,\nCibiru, Kota Bandung,\nJawa Barat, Indonesia',
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      await sendEmail('ppid@uinsgd.ac.id');
                    },
                    icon: SvgPicture.asset(
                      'assets/svgs/email.svg',
                      color: Colors.blue,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 14),
                  Flexible(
                    child: TextWidget('ppid@uinsgd.ac.id', fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      await call('+6285173311968');
                    },
                    icon: SvgPicture.asset(
                      'assets/svgs/phone.svg',
                      color: Colors.blue,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 14),
                  Flexible(
                    child: TextWidget('+62 xxx xxx xxx xx', fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          _buildDivider(),
          // Column(
          //   children: List.generate(contents.length, (index) {
          //     return _buildContactInfo(
          //       svgName: svgsNames[index],
          //       text: contents[index],
          //     );
          //   }),
          // )
        ],
      ),
    );
  }

  void getCurrentUser() async {
    var user = await _preferences.getCurrentUserValue();
    setState(() {
      if (user != null) {
        var map = jsonDecode(user);
        _user = User.fromJson(map);
        log('$_user');
      }
    });
  }

  Widget _buildDivider() {
    return Column(
      children: [
        Center(
          child: Divider(
            height: 80,
            thickness: 3,
            color: Colors.black,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              'Sosial Media',
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            LaunchButton(
                svg: 'assets/svgs/instagram.svg',
                push: () async {
                  await openUrl('https://www.instagram.com/uinsgd.official/');
                }),
            LaunchButton(
                svg: 'assets/svgs/youtube.svg',
                push: () async {
                  await openUrl(
                      'https://www.youtube.com/channel/UCEeGdjh7dfuAJUQAQCq1ZQA');
                }),
            LaunchButton(
                svg: 'assets/svgs/tiktok.svg',
                push: () async {
                  await openUrl('https://www.tiktok.com/@uinsgd.official');
                }),
            LaunchButton(
                svg: 'assets/svgs/twitter.svg',
                push: () async {
                  await openUrl('https://twitter.com/uinsgd_official');
                }),
            LaunchButton(
                svg: 'assets/svgs/facebook.svg',
                push: () async {
                  await openUrl('https://www.facebook.com/uinsgdofficial/');
                }),
          ],
        )
      ],
    );
  }
}

class LaunchButton extends StatelessWidget {
  final String svg;
  final VoidCallback push;

  LaunchButton({Key? key, required this.svg, required this.push})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: push,
        icon: SvgPicture.asset(
          svg,
          height: 30,
        ),
      ),
    );
  }
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}

Future<void> call(String phoneNumber) async {
  await launch('tel:$phoneNumber');
}

Future<void> sendEmail(String email) async {
  await launch('mailto:$email');
}
