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
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/modules/home/bloc/home_bloc.dart';
import 'package:ppid_mobile/modules/home/components/carousel.dart';
import 'package:ppid_mobile/modules/home/components/home_card.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
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
    _homeBloc.add(SetToInitEvent());
    getCurrentUser();
    _beritaUinBloc.add(GetBeritaUinEvent());
    _beritaPpidBloc.add(GetBeritaPpidEvent());
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
      // centerTitle: false,
      leading: _user != null
          ? Padding(
              padding: EdgeInsets.only(left: 24),
              child: Container(
                // width: 20,
                // height: 20,
                decoration: BoxDecoration(
                  color: Pallete.blue,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : Container(),
      actions: [
        _user != null
            ? IconButton(
                onPressed: () {
                  logout();
                  Navigator.pushReplacementNamed(context, 'splash');
                },
                splashRadius: 25,
                icon: SvgPicture.asset("assets/svgs/logout.svg"),
                tooltip: "Notifikasi",
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
      "application-objection",
      "application-complaint",
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
                  Navigator.pushNamed(
                    context,
                    'sign-in',
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBeritaUinList(List<BeritaUin> list) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _beritaUinBloc,
      builder: (context, state) {
        // if (kDebugMode) {
        //   log("BERITA PPID STATE: $state");
        // }

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
  }

  Widget _buildBeritaPpidList(List<BeritaPpid> list) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _beritaPpidBloc,
      builder: (context, state) {
        if (kDebugMode) {
          log("BERITA PPID STATE: $state");
        }

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

  void logout() async {
    _preferences.removeCurrentUserValue();
  }
}
