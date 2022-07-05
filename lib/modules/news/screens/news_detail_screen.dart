// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/modules/news/arguments/news_detail_screen_argument.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum NewsDetailType {
  uin,
  ppid,
}

class NewsDetailScreen extends StatefulWidget {
  NewsDetailScreenArgument? argument;
  NewsDetailScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late String _baseUrl;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }

    if (widget.argument!.type == NewsDetailType.uin) {
      _baseUrl = "https://uinsgd.ac.id";
    } else {
      _baseUrl = "https://ppid.uinsgd.ac.id/post";
    }

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
    return customAppBar(context: context);
  }

  Widget _buildBody() {
    return WebView(
      initialUrl: "$_baseUrl/${widget.argument!.slug}",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}