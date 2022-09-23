// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

class CallCenterScreen extends StatefulWidget {
  const CallCenterScreen({Key? key}) : super(key: key);

  @override
  State<CallCenterScreen> createState() => _CallCenterScreenState();
}

class _CallCenterScreenState extends State<CallCenterScreen> {
  final PpidSharedPreferences _sharedPreferences = PpidSharedPreferences();
  User? _user;

  @override
  void initState() {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) async {
    getuserInfo();
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
            _user != null ? Container() : _buildFirstContainer(),
            SizedBox(height: 40),
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

  Widget _buildSecondContainer() {
    final List<String> contents = [
      'Jl. A.H. Nasution No. 105A, Cibiru, Kota Bandung, Jawa Barat, Indonesia',
      'ppid@uinsgd.ac.id',
      '+62 xxx xxx xxx xx',
    ];

    final List<String> svgsNames = [
      'map_pin.svg',
      'email.svg',
      'phone.svg',
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
              'Kontak kami',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildContactInfo(
                svgName: svgsNames[index],
                text: contents[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: contents.length,
          ),
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

  Widget _buildContactInfo({
    required String svgName,
    required String text,
  }) {
    return Row(
      children: [
        SvgPicture.asset('assets/svgs/$svgName'),
        SizedBox(width: 14),
        Flexible(
          child: TextWidget(text, fontSize: 12),
        ),
      ],
    );
  }

  getuserInfo() async {
    var map = await _sharedPreferences.getCurrentUserValue();
    setState(() {
      _user = User.fromJson(jsonDecode(map));
    });
  }
}
