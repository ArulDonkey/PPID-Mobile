import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class ApplicationObjectionScreen extends StatefulWidget {
  const ApplicationObjectionScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationObjectionScreen> createState() =>
      _ApplicationObjectionScreenState();
}

class _ApplicationObjectionScreenState
    extends State<ApplicationObjectionScreen> {
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
    return Center(
      child: TextWidget("Keberatan"),
    );
  }
}
