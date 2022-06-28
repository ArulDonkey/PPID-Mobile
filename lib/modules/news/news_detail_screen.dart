// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
      initialUrl: "https://ppid.uinsgd.ac.id/home",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
