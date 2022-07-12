// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/no_connection_screen.dart';
import 'package:ppid_mobile/components/refresh_component.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:ppid_mobile/modules/news/arguments/news_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/bloc/news_bloc.dart';
import 'package:ppid_mobile/modules/news/components/news_list_item.dart';
import 'package:ppid_mobile/modules/news/screens/news_detail_screen.dart';

enum NewsListType {
  uin,
  ppid,
}

class NewsListScreen extends StatefulWidget {
  NewsListScreenArgument? argument;
  NewsListScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late String title;

  final NewsBloc _newsBloc = NewsBloc();

  final List<BeritaPpid> _beritaPpids = [];
  final List<BeritaUin> _beritaUins = [];

  @override
  void initState() {
    if (widget.argument!.type == NewsListType.ppid) {
      title = "Berita PPID UIN Sunan Gunung Djati Bandung";
    } else {
      title = "Berita UIN Sunan Gunung Djati Bandung";
    }

    refresh();

    super.initState();
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }

  void refresh() {
    if (widget.argument!.type == NewsListType.ppid) {
      _newsBloc.add(GetBeritaPpidEvent());
    } else {
      _newsBloc.add(GetBeritaUinEvent());
    }
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
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: widget.argument!.type == NewsListType.ppid
          ? _buildPpidNewsList(_beritaPpids)
          : _buildUinNewsList(_beritaUins),
    );
  }

  Widget _buildPpidNewsList(List<BeritaPpid> list) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _newsBloc,
      builder: (context, state) {
        if (state is NewsInitialState || state is BeritaPpidLoadingState) {
          return LoadingWidget();
        } else if (state is BeritaPpidNoConnectionState) {
          return NoConnectionScreen(
            onRefresh: refresh,
            description: "Perangkat anda tidak terhubung ke internet",
          );
        } else if (state is BeritaPpidEmptyState) {
          return Center(
            child: TextWidget("text"),
          );
        } else if (state is BeritaPpidLoadedState) {
          list = state.list;

          return RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
                    child: TextWidget(
                      title,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.separated(
                    primary: false,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsListItem(
                        title: list[index].postTitle ?? "",
                        // description: "description",
                        date: (list[index].postDate).toString(),
                        imageUrl: list[index].postBanner!,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "news-detail",
                            arguments: NewsDetailScreenArgument(
                              slug: list[index].postName,
                              type: NewsDetailType.ppid,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: list.length,
                  ),
                ],
              ),
            ),
          );
        } else if (state is BeritaPpidErrorState) {
          return RefreshComponent(onRefresh: refresh);
        } else {
          return RefreshComponent(onRefresh: refresh);
        }
      },
    );
  }

  Widget _buildUinNewsList(List<BeritaUin> list) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _newsBloc,
      builder: (context, state) {
        if (state is NewsInitialState || state is BeritaUinLoadingState) {
          return LoadingWidget();
        } else if (state is BeritaUinNoConnectionState) {
          return NoConnectionScreen(
            onRefresh: refresh,
            description: "Perangkat anda tidak terhubung ke internet",
          );
        } else if (state is BeritaUinEmptyState) {
          return TextWidget("text");
        } else if (state is BeritaUinLoadedState) {
          list = state.list;

          return RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
                    child: TextWidget(
                      title,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.separated(
                    primary: false,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsListItem(
                        title: list[index].title!.rendered ?? "",
                        // description: "description",
                        date: (list[index].date).toString(),
                        imageUrl: list[index].jetpackFeaturedMediaUrl!,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "news-detail",
                            arguments: NewsDetailScreenArgument(
                              slug: list[index].slug,
                              type: NewsDetailType.uin,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: list.length,
                  ),
                ],
              ),
            ),
          );
        } else if (state is BeritaUinErrorState) {
          return RefreshComponent(onRefresh: refresh);
        } else {
          return RefreshComponent(onRefresh: refresh);
        }
      },
    );
  }
}
