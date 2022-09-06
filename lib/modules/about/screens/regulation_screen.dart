import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class RegulationScreen extends StatefulWidget {
  const RegulationScreen({Key? key}) : super(key: key);

  @override
  State<RegulationScreen> createState() => _RegulationScreenState();
}

class _RegulationScreenState extends State<RegulationScreen> {
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
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: Center(
        child: TextWidget("Regulasi"),
      ),
    );
  }
}
