// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/home/bloc/home_bloc.dart';
import 'package:ppid_mobile/modules/home/components/carousel.dart';
import 'package:ppid_mobile/modules/home/components/home_card.dart';
import 'package:ppid_mobile/modules/home/components/news_item.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

  final int _pageIndex = 0;
  int _selectedNavbarIndex = 0;

  final List<String> _navbarIconUrls = [
    "assets/svgs/beranda.svg",
    "assets/svgs/layanan.svg",
    "assets/svgs/hubungi_kami.svg",
    "assets/svgs/informasi.svg",
    "assets/svgs/tentang_kami.svg",
  ];

  final List<String> _navbarLabels = [
    "Beranda",
    "Layanan",
    "Hubungi Kami",
    "Informasi",
    "Tentang Kami",
  ];

  final List<String> _homeCardIconUrls = [
    "assets/svgs/permohonan.svg",
    "assets/svgs/keberatan.svg",
    "assets/svgs/pengaduan.svg",
  ];

  final List<String> _homeCardLabels = [
    "Permohonan",
    "Keberatan",
    "Pengaduan",
  ];

  List<BeritaUin> _beritaUins = [];

  @override
  void initState() {
    _homeBloc.add(GetBeritaUinEvent());
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavbar(
        icons: _navbarIconUrls,
        labels: _navbarLabels,
      ),
    );
  }

  _onNavbarItemTapped(int index) {
    setState(() {
      _selectedNavbarIndex = index;
    });
  }

  AppBar _buildAppbar() {
    return customAppBar(
      context: context,
      backButton: false,
      title: Image.asset(
        "assets/images/ppid_logo.png",
        width: 60,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 30,
          icon: SvgPicture.asset("assets/svgs/notification.svg"),
          tooltip: "Notifikasi",
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: BackgroundedContainer(
        child: RefreshIndicator(
          onRefresh: () async {
            _homeBloc.add(GetBeritaUinEvent());
          },
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 20),
            children: [
              Carousel(
                // imageUrls: _carouselImageUrls,
                index: _pageIndex,
              ),
              SizedBox(height: 50),
              _buildHomeCard(
                cardIcons: _homeCardIconUrls,
                cardLabels: _homeCardLabels,
                onTap: () {},
              ),
              SizedBox(height: 50),
              // SizedBox(
              //   height: 200,
              //   child: NewsSlider(
              //     title: "Berita PPID UIN Sunan Gunung Djati Bandung",
              //     count: 10,
              //     onTap: () {
              //       Navigator.pushNamed(context, "news");
              //     },
              //   ),
              // ),
              SizedBox(height: 24),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  log("Home View: $state");

                  if (state is HomeInitialState ||
                      state is BeritaUinLoadingState) {
                    return LoadingWidget();
                  } else if (state is BeritaUinEmptyState) {
                    return Text(state.toString());
                  } else if (state is BeritaUinLoadedState) {
                    _beritaUins = state.list;

                    return SizedBox(
                      height: 200,
                      child: _buildBeritaUinList(
                        title: "Berita UIN Sunan Gunung Djati Bandung",
                        list: _beritaUins,
                      ),
                    );
                  } else if (state is BeritaUinErrorState) {
                    return Center(
                      child: TextWidget(state.message),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
            // ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeCard({
    required List<String> cardIcons,
    required List<String> cardLabels,
    Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) {
            return HomeCard(
              iconUrl: cardIcons[index],
              title: cardLabels[index],
              description: "Informasi Publik",
              onTap: onTap,
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavbar({
    required List<String> icons,
    required List<String> labels,
  }) {
    return BottomNavigationBar(
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
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
      ),
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: SvgPicture.asset(
              icons[index],
              width: index == 3 ? 9 : 20,
            ),
          ),
          label: labels[index],
        );
      }),
    );
  }

  Widget _buildBeritaUinList({
    required String title,
    required List<BeritaUin> list,
    Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextWidget(
            title,
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
                imageUrl: list[index].yoastHeadJson!.ogImage![index].url!,
                title: list[index].title!.rendered!,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 12);
            },
            itemCount: list.length,
          ),
        ),
        // SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            // onTap: () => log("test"),
            onTap: onTap,
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
