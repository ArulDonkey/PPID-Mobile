// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/about/screens/about_screen.dart';
import 'package:ppid_mobile/modules/call_center/screens/call_center_screen.dart';
import 'package:ppid_mobile/modules/home/screens/home_screen.dart';
import 'package:ppid_mobile/modules/information/screens/information_screen.dart';
import 'package:ppid_mobile/modules/service/screens/service_screen.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';

class BaseScreen extends StatefulWidget {
  BaseScreenArgument? argument;
  BaseScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late int _selectedNavbarIndex;

  final List<Widget> _navbarPages = [
    HomeScreen(),
    // DeleteLaterScreen2(),
    ServiceScreen(),
    CallCenterScreen(),
    InformationScreen(),
    AboutScreen(),
  ];

  void _onNavbarItemTapped(int index) {
    setState(() {
      _selectedNavbarIndex = index;
    });
  }

  @override
  void initState() {
    if (widget.argument!.index != null) {
      _selectedNavbarIndex = widget.argument!.index!;
    } else {
      _selectedNavbarIndex = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navbarPages[_selectedNavbarIndex],
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  Widget _buildBottomNavbar() {
    final List<String> navbarIconUrls = [
      "assets/svgs/beranda.svg",
      "assets/svgs/layanan.svg",
      "assets/svgs/hubungi_kami.svg",
      "assets/svgs/informasi.svg",
      "assets/svgs/tentang_kami.svg",
    ];

    final List<String> navbarLabels = [
      "Beranda",
      "Layanan",
      "Hubungi Kami",
      "Informasi",
      "Tentang Kami",
    ];

    // return TitledBottomNavigationBar(
    //   onTap: _onNavbarItemTapped,
    //   items: List.generate(navbarLabels.length, (index) {
    //     return TitledNavigationBarItem(
    //       icon: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 4.0),
    //         child: SvgPicture.asset(
    //           navbarIconUrls[index],
    //           width: index == 3 ? 9 : 20,
    //         ),
    //       ),
    //       label: navbarLabels[index],
    //     );
    //   }),
    // );

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onNavbarItemTapped,
        currentIndex: _selectedNavbarIndex,
        backgroundColor: Pallete.navy,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 2,
          // shadows: [
          //   Shadow(
          //     color: Colors.red,
          //     offset: Offset(0, -5),
          //   ),
          // ],
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        items: List.generate(navbarLabels.length, (index) {
          return BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                navbarIconUrls[index],
                width: index == 3 ? 9 : 20,
              ),
            ),
            label: navbarLabels[index],
          );
        }),
      ),
    );
  }
}
