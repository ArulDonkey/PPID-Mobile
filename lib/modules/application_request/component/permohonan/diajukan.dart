// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';

class PermohonanDiajukan extends StatefulWidget {
  const PermohonanDiajukan({Key? key}) : super(key: key);

  @override
  State<PermohonanDiajukan> createState() => _PermohonanDiajukanState();
}

class _PermohonanDiajukanState extends State<PermohonanDiajukan> {
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
    return BackgroundedContainer(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Center(child: Text('Permohonan Diajukan')),
      ),
    );
  }
}
