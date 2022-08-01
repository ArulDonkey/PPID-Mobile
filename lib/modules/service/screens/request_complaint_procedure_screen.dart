// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class RequestComplaintProcedureScreen extends StatefulWidget {
  const RequestComplaintProcedureScreen({Key? key}) : super(key: key);

  @override
  State<RequestComplaintProcedureScreen> createState() =>
      _RequestComplaintProcedureScreenState();
}

class _RequestComplaintProcedureScreenState
    extends State<RequestComplaintProcedureScreen> {
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
              "Prosedur Pengajuan Keberatan",
              fontWeight: FontWeight.bold,
            ),
            SvgPicture.asset("assets/svgs/request_complaint_procedure.svg"),
            PrimaryButton(
              onTap: () {
                Navigator.pushNamed(context, "application-objection");
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 32),
              backgroundColor: Pallete.lightGreen,
              child: TextWidget(
                "Ajukan Keberatan",
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
