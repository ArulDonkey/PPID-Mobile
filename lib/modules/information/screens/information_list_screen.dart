// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/no_connection_screen.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/information/arguments/information_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/information/arguments/information_list_screen_argument.dart';
import 'package:ppid_mobile/modules/information/bloc/public_information_bloc.dart';
import 'package:ppid_mobile/modules/information/components/information_item.dart';
import 'package:ppid_mobile/modules/information/models/public_information/public_information.dart';

enum InformationListType {
  type1,
  type2,
  type3,
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
  int type = 0;
  final PublicInformationBloc _publicInformationBloc = PublicInformationBloc();

  List<PublicInformation> _publicInformations = [];

  @override
  void initState() {
    if (widget.argument!.type == InformationListType.type1) {
      title = "Informasi Wajib Berkala";
      type = 1;
    } else if (widget.argument!.type == InformationListType.type2) {
      title = "Informasi Wajib Tersedia Setiap Saat";
      type = 2;
    } else {
      title = "Informasi Wajib Diumumkan Serta Merta";
      type = 3;
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
      child: RefreshIndicator(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SvgPicture.asset("assets/svgs/informasi_publik.svg"),
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
                  )
                ],
              ),
              SizedBox(height: 24),
              _buildInformationList(_publicInformations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformationList(List<PublicInformation> list) {
    return BlocBuilder<PublicInformationBloc, PublicInformationState>(
      bloc: _publicInformationBloc,
      builder: (context, state) {
        // if (kDebugMode) log(state.toString());

        if (state is PublicInformationInitialState ||
            state is PublicInformationLoadingState) {
          return LoadingWidget();
        } else if (state is PublicInformationNoConnectionState) {
          return NoConnectionScreen(
            onRefresh: refresh,
          );
        } else if (state is PublicInformationEmptyState) {
          return Container();
        } else if (state is PublicInformationLoadedState) {
          _publicInformations = state.list;

          return ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              var subInformation = _publicInformations[index].subInfoPub;

              // log("SUB INFO TYPE INDEX $index: ${subInformation.runtimeType}");

              if (subInformation.runtimeType == List<dynamic>) {
                return Column(
                  children: [
                    InformationItem(
                      type: InformationItemType.secondary,
                      content: _publicInformations[index].namaInfoPub!,
                      secondaryNumber: "${index + 1}. ",
                      onTap: () {
                        var url = _publicInformations[index].linkInfoPub;

                        if (url != "#") {
                          Navigator.pushNamed(
                            context,
                            "information-detail",
                            arguments: InformationDetailScreenArgument(
                              url: url,
                            ),
                          );
                        }
                      },
                    ),
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
                                    return InformationItem(
                                      type: InformationItemType.secondary,
                                      content: subInformation[index]
                                          ["nama_sub_info_pub"],
                                      secondaryNumber: "-",
                                      onTap: () {
                                        var url = _publicInformations[index]
                                            .linkInfoPub;

                                        if (url != "#") {
                                          Navigator.pushNamed(
                                            context,
                                            "information-detail",
                                            arguments:
                                                InformationDetailScreenArgument(
                                              url: url,
                                            ),
                                          );
                                        }
                                      },
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
                );
              }

              return InformationItem(
                type: InformationItemType.secondary,
                content: _publicInformations[index].namaInfoPub!,
                secondaryNumber: "${index + 1}. ",
                onTap: () {
                  var url = _publicInformations[index].linkInfoPub;

                  if (url != "#") {
                    Navigator.pushNamed(
                      context,
                      "information-detail",
                      arguments: InformationDetailScreenArgument(
                        url: url,
                      ),
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
        } else if (state is PublicInformationErrorState) {
          return RefreshComponent(onRefresh: refresh);
        } else {
          return RefreshComponent(onRefresh: refresh);
        }
      },
    );
  }

  String loopChar() {
    String char = "a";

    return String.fromCharCode(char.codeUnitAt(0) + 1);
  }
}
