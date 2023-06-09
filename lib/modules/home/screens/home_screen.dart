// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/modules/home/bloc/home_bloc.dart';
import 'package:ppid_mobile/modules/home/components/carousel.dart';
import 'package:ppid_mobile/modules/home/components/home_card.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:ppid_mobile/modules/home/models/home_berita.dart';
import 'package:ppid_mobile/modules/news/components/news_horizontal_list.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PpidSharedPreferences _preferences = PpidSharedPreferences();
  final HomeBloc _homeBloc = HomeBloc();
  final HomeBloc _beritaUinBloc = HomeBloc();
  final HomeBloc _beritaPpidBloc = HomeBloc();
  final HomeBerita _homeBerita = HomeBerita();
  User? _user;

  final int _pageIndex = 0;

  final List<String> _imageUrls = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png'
  ];

  List<BeritaUin> _beritaUins = [];
  List<BeritaPpid> _beritaPpids = [];

  @override
  void initState() {
    getCurrentUser();
    _homeBloc.add(SetToInitEvent());

    if (_homeBerita.getUin().isEmpty) {
      _beritaUinBloc.add(GetBeritaUinEvent());
    } else {
      _beritaUins = _homeBerita.getUin();
    }

    if (_homeBerita.getPpid().isEmpty) {
      _beritaPpidBloc.add(GetBeritaPpidEvent());
    } else {
      _beritaPpids = _homeBerita.getPpid();
    }
    super.initState();
  }

  @override
  void dispose() {
    _beritaUinBloc.close();
    _beritaPpidBloc.close();
    _homeBloc.close();
    super.dispose();
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
      showLogo: true,
      leading: _user != null
          ? Padding(
              padding: EdgeInsets.only(left: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Pallete.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: TextWidget(
                    _user!.nama![0],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(),
      actions: [
        _user != null
            ? IconButton(
                onPressed: logout,
                splashRadius: 25,
                icon: SvgPicture.asset("assets/svgs/logout.svg"),
                tooltip: "Keluar",
              )
            : Container(),
        SizedBox(width: 14),
      ],
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: RefreshIndicator(
        onRefresh: () async {
          _homeBloc.add(SetToInitEvent());
          _beritaUinBloc.add(GetBeritaUinEvent());
          _beritaPpidBloc.add(GetBeritaPpidEvent());
        },
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            Carousel(
              imageUrls: _imageUrls,
              index: _pageIndex,
            ),
            SizedBox(height: 50),
            _buildHomeCard(),
            SizedBox(height: 40),
            _buildBeritaPpidList(_beritaPpids),
            SizedBox(height: 24),
            _buildBeritaUinList(_beritaUins),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCard() {
    final List<String> homeCardLabels = [
      "Permohonan",
      "Keberatan",
      "Pengaduan",
    ];

    final List<String> homeCardIconUrls = [
      "assets/svgs/permohonan.svg",
      "assets/svgs/keberatan.svg",
      "assets/svgs/pengaduan.svg",
    ];

    final List<String> navigations = [
      "application-letter",
      "under-construction",
      "under-construction",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          homeCardLabels.length,
          (index) {
            return HomeCard(
              iconUrl: homeCardIconUrls[index],
              title: homeCardLabels[index],
              description: "Informasi Publik",
              onTap: () {
                if (_user != null) {
                  Navigator.pushNamed(
                    context,
                    navigations[index],
                  );
                } else {
                  login();
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBeritaUinList(List<BeritaUin> list) {
    if (_beritaUins.isEmpty) {
      return BlocBuilder<HomeBloc, HomeState>(
        bloc: _beritaUinBloc,
        builder: (context, state) {
          if (kDebugMode) log("BERITA UIN STATE: $state");

          if (state is HomeInitialState || state is BeritaUinLoadingState) {
            return LoadingWidget();
          } else if (state is BeritaUinNoConnectionState) {
            return RefreshComponent(onRefresh: () {
              _beritaUinBloc.add(GetBeritaUinEvent());
            });
          } else if (state is BeritaUinEmptyState) {
            return Text(state.toString());
          } else if (state is BeritaUinLoadedState) {
            _beritaUins = state.list;

            return SizedBox(
              height: 220,
              child: NewsHorizontalList(
                title: "Berita UIN Sunan Gunung Djati Bandung",
                list: _beritaUins,
                type: NewsHorizontalListType.uin,
              ),
            );
          } else if (state is BeritaUinErrorState) {
            return RefreshComponent(onRefresh: () {
              _beritaUinBloc.add(GetBeritaUinEvent());
            });
          } else {
            return RefreshComponent(onRefresh: () {
              _beritaUinBloc.add(GetBeritaUinEvent());
            });
          }
        },
      );
    } else {
      return SizedBox(
        height: 220,
        child: NewsHorizontalList(
          title: "Berita UIN Sunan Gunung Djati Bandung",
          list: _beritaUins,
          type: NewsHorizontalListType.uin,
        ),
      );
    }
  }

  Widget _buildBeritaPpidList(List<BeritaPpid> list) {
    if (_beritaPpids.isEmpty) {
      return BlocBuilder<HomeBloc, HomeState>(
        bloc: _beritaPpidBloc,
        builder: (context, state) {
          // if (kDebugMode) log("BERITA PPID STATE: $state");

          if (state is HomeInitialState || state is BeritaPpidLoadingState) {
            return LoadingWidget();
          } else if (state is BeritaPpidNoConnectionState) {
            return RefreshComponent(onRefresh: () {
              _beritaPpidBloc.add(GetBeritaPpidEvent());
            });
          } else if (state is BeritaPpidEmptyState) {
            return Text(state.toString());
          } else if (state is BeritaPpidLoadedState) {
            _beritaPpids = state.list;

            return SizedBox(
              height: 220,
              child: NewsHorizontalList(
                title: "Berita PPID UIN Sunan Gunung Djati Bandung",
                list: _beritaPpids,
                type: NewsHorizontalListType.ppid,
              ),
            );
          } else if (state is BeritaPpidErrorState) {
            return RefreshComponent(onRefresh: () {
              _beritaPpidBloc.add(GetBeritaPpidEvent());
            });
          } else {
            return RefreshComponent(onRefresh: () {
              _beritaPpidBloc.add(GetBeritaPpidEvent());
            });
          }
        },
      );
    } else {
      return SizedBox(
        height: 220,
        child: NewsHorizontalList(
          title: "Berita PPID UIN Sunan Gunung Djati Bandung",
          list: _beritaPpids,
          type: NewsHorizontalListType.ppid,
        ),
      );
    }
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

  // void getBeritaPpidLocal() async {
  //   var list = await _preferences.getBeritaPpids();
  //   log('$list');
  // }

  void login() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    'Untuk melanjutkan anda harus masuk terlebih dahulu',
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 16),
                  PrimaryButton(
                    backgroundColor: Pallete.blue,
                    width: double.infinity,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, 'sign-in');
                    },
                    child: TextWidget(
                      'Masuk',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void logout() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    'Anda yakin ingin keluar?',
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          elevation: 0,
                          borderRadius: 60,
                          backgroundColor: Colors.white,
                          width: double.infinity,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          child: TextWidget('Tidak'),
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: PrimaryButton(
                          elevation: 0,
                          borderRadius: 60,
                          backgroundColor: Pallete.red,
                          width: double.infinity,
                          onTap: () {
                            Navigator.pop(context);
                            _preferences.removeCurrentUserValue();
                            Navigator.pushReplacementNamed(context, 'splash');
                          },
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          child: TextWidget(
                            'Ya',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
