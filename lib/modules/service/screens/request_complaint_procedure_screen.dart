// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

class RequestComplaintProcedureScreen extends StatefulWidget {
  const RequestComplaintProcedureScreen({Key? key}) : super(key: key);

  @override
  State<RequestComplaintProcedureScreen> createState() =>
      _RequestComplaintProcedureScreenState();
}

class _RequestComplaintProcedureScreenState
    extends State<RequestComplaintProcedureScreen> {
  User? _user;

  @override
  void initState() {
    getCurrentUser();
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
                // if (_user != null) {
                //   Navigator.pushNamed(context, "application-objection");
                // } else {
                //   login();
                // }
                Navigator.pushNamed(context, "under-construction");
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

  void login() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    'Untuk melanjutkan anda harus masuk terlebih dahulu',
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  SizedBox(height: 16),
                  PrimaryButton(
                    backgroundColor: Pallete.blue,
                    width: double.infinity,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, 'sign-in');
                    },
                    child: TextWidget(
                      'Masuk',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void getCurrentUser() async {
    PpidSharedPreferences prefs = PpidSharedPreferences();
    var x = await prefs.getCurrentUserValue();
    var map = jsonDecode(x);

    setState(() {
      _user = User.fromJson(map);
    });
  }
}
