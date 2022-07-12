import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class ApplicationComplaintScreen extends StatefulWidget {
  const ApplicationComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationComplaintScreen> createState() =>
      _ApplicationComplaintScreenState();
}

class _ApplicationComplaintScreenState
    extends State<ApplicationComplaintScreen> {
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
      child: TextWidget("Pengaduan"),
    );
  }
}
