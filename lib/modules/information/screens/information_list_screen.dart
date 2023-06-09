// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_screen.dart';
import 'package:ppid_mobile/components/no_connection_screen.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/information/arguments/information_list_screen_argument.dart';
import 'package:ppid_mobile/modules/information/bloc/public_information_bloc.dart';
import 'package:ppid_mobile/modules/information/components/information_item.dart';
import 'package:ppid_mobile/modules/information/models/public_information/public_information.dart';
import 'package:url_launcher/url_launcher.dart';

enum InformationListType {
  type1,
  type2,
  type3,
  type4,
  type5,
}

class InformationListScreen extends StatefulWidget {
  InformationListScreenArgument? argument;
  InformationListScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<InformationListScreen> createState() => _InformationListScreenState();
}

class _InformationListScreenState extends State<InformationListScreen> {
  late String title;
  late int type;
  final PublicInformationBloc _publicInformationBloc = PublicInformationBloc();

  List<PublicInformation> _publicInformations = [];

  @override
  void initState() {
    if (widget.argument!.type == InformationListType.type1) {
      title = "Informasi Wajib Berkala";
      type = 1661783928317;
    } else if (widget.argument!.type == InformationListType.type2) {
      title = "Informasi Wajib Tersedia Setiap Saat";
      type = 1661783959079;
    } else if (widget.argument!.type == InformationListType.type3) {
      title = "Informasi Wajib Diumumkan Serta Merta";
      type = 1661783985654;
    } else if (widget.argument!.type == InformationListType.type4) {
      title = "Daftar Informasi yang Dikecualikan";
      type = 1663424587901;
    } else {
      title = "Berita Penanganan Covid";
      type = 1661783985654;
    }

    refresh();
    super.initState();
  }

  refresh() {
    _publicInformationBloc.add(GetPublicInformationEvent("$type"));
  }

  @override
  void dispose() {
    _publicInformationBloc.close();
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
      showLogo: true,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: _buildInformationList(),
    );
  }

  Widget _buildInformationList() {
    return BlocBuilder<PublicInformationBloc, PublicInformationState>(
      bloc: _publicInformationBloc,
      builder: (context, state) {
        if (kDebugMode) log(state.toString());

        if (state is PublicInformationInitialState ||
            state is PublicInformationLoadingState) {
          return LoadingScreen();
        } else if (state is PublicInformationNoConnectionState) {
          return NoConnectionScreen(
            onRefresh: refresh,
          );
        } else if (state is PublicInformationEmptyState) {
          return Container();
        } else if (state is PublicInformationLoadedState) {
          _publicInformations = state.list;

          return RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SvgPicture.asset(
                            "assets/svgs/informasi_publik.svg"),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Informasi Publik",
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              title,
                              fontSize: 12,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildList(),
                ],
              ),
            ),
          );
        } else if (state is PublicInformationErrorState) {
          return RefreshComponent(onRefresh: refresh);
        } else {
          return RefreshComponent(onRefresh: refresh);
        }
      },
    );
  }

  Widget _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        var subInformation = _publicInformations[index].subInfoPub;

        // log("SUB INFO TYPE INDEX $index: ${subInformation.runtimeType}");

        if (subInformation.runtimeType == List<dynamic>) {
          return Column(
            children: [
              ExpansionTile(
                title: InformationItem(
                  type: InformationItemType.secondary,
                  content: _publicInformations[index].namaInfoPub!,
                  secondaryNumber: "${index + 1}. ",
                  showSuffixIcon: subInformation.length > 0 ? false : true,
                  onTap: () {
                    var url = _publicInformations[index].linkInfoPub;

                    if (url != "#") {
                      launchUrl(
                        Uri.parse(url ?? ''),
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                children: [
                  Builder(
                    builder: (context) {
                      if (subInformation.runtimeType == List<dynamic>) {
                        for (int i = 0; i < subInformation.length; i++) {
                          return Column(
                            children: [
                              SizedBox(height: 16),
                              ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: InformationItem(
                                      type: InformationItemType.secondary,
                                      showSuffixIcon: widget.argument!.type ==
                                              InformationListType.type4
                                          ? false
                                          : true,
                                      content: subInformation[index]
                                          ["nama_sub_info_pub"],
                                      secondaryNumber: "-",
                                      onTap: () {
                                        String url = subInformation[index]
                                            ["link_sub_info_pub"];

                                        if (url != "#") {
                                          var subInfo = subInformation[index]
                                              ['nama_sub_info_pub'];
                                          if (subInfo ==
                                              'Masukan-masukan dari berbagai pihak atas peraturan, keputusan atau kebijakan yang dibentuk') {
                                            url = url.trimRight();
                                          }
                                          launchUrl(
                                            Uri.parse(url),
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16),
                                itemCount: subInformation.length,
                              ),
                            ],
                          );
                        }
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            ],
          );
        }

        return InformationItem(
          type: InformationItemType.secondary,
          content: _publicInformations[index].namaInfoPub!,
          secondaryNumber: "${index + 1}. ",
          showSuffixIcon:
              widget.argument!.type == InformationListType.type4 ? false : true,
          onTap: () {
            var url = _publicInformations[index].linkInfoPub;

            if (url != "#") {
              launchUrl(
                Uri.parse(url ?? ''),
                mode: LaunchMode.externalApplication,
              );
            }
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
      itemCount: _publicInformations.length,
    );
  }

  // String loopChar() {
  //   String char = "a";

  //   return String.fromCharCode(char.codeUnitAt(0) + 1);
  // }
}
