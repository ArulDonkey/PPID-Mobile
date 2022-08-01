// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class RequestInformationProcedureScreen extends StatefulWidget {
  const RequestInformationProcedureScreen({Key? key}) : super(key: key);

  @override
  State<RequestInformationProcedureScreen> createState() =>
      _RequestInformationProcedureScreenState();
}

class _RequestInformationProcedureScreenState
    extends State<RequestInformationProcedureScreen> {
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
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              "Prosedur Permohonan Informasi",
              fontWeight: FontWeight.bold,
            ),
            SvgPicture.asset("assets/svgs/request_information_procedure.svg"),
            PrimaryButton(
              onTap: () {
                Navigator.pushNamed(context, "application-letter");
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 32),
              backgroundColor: Pallete.lightGreen,
              child: TextWidget(
                "Ajukan Permohonan Informasi",
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
