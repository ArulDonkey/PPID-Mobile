import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class ApplicationLetterScreen extends StatefulWidget {
  const ApplicationLetterScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationLetterScreen> createState() =>
      _ApplicationLetterScreenState();
}

class _ApplicationLetterScreenState extends State<ApplicationLetterScreen> {
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
      child: TextWidget("Permohonan"),
    );
  }
}
