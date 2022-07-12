// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/modules/information/arguments/information_detail_screen_argument.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InformationDetailScreen extends StatefulWidget {
  InformationDetailScreenArgument? argument;
  InformationDetailScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<InformationDetailScreen> createState() =>
      _InformationDetailScreenState();
}

class _InformationDetailScreenState extends State<InformationDetailScreen> {
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
      actions: [
        widget.argument!.url != "#"
            ? IconButton(
                onPressed: share,
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: 22,
                ),
                splashRadius: 25,
              )
            : Container(),
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.argument!.url,
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
        ),
        _isLoading ? LoadingWidget() : Container(),
      ],
    );
  }

  share() async {
    final String message = widget.argument!.url!;

    await Share.share(message);
  }
}
