// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/modules/about/arguments/about_webview_screen_argument.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutWebviewScreen extends StatefulWidget {
  AboutWebviewScreenArgument? argument;
  AboutWebviewScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<AboutWebviewScreen> createState() => _AboutWebviewScreenState();
}

class _AboutWebviewScreenState extends State<AboutWebviewScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
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
    return customAppBar(
      context: context,
      showLogo: false,
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        WebView(
          initialUrl: "${widget.argument!.url}",
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (_) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (_) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (_) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
        _isLoading ? LoadingWidget() : Container(),
      ],
    );
  }

  share() async {
    // final String message =
    //     "Cek inforrmasi terbaru dari $type: \n\n $_baseUrl/${widget.argument!.slug}";

    // await Share.share(message);
  }
}
