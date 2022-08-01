import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class DeleteLaterScreen2 extends StatefulWidget {
  const DeleteLaterScreen2({Key? key}) : super(key: key);

  @override
  State<DeleteLaterScreen2> createState() => _DeleteLaterScreen2State();
}

class _DeleteLaterScreen2State extends State<DeleteLaterScreen2> {
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
      backButton: false,
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryButton(
            onTap: () {
              Navigator.pushNamed(context, "request-information-procedure");
            },
            child: TextWidget(
              "1",
              color: Colors.white,
            ),
          ),
          PrimaryButton(
            onTap: () {
              Navigator.pushNamed(context, "request-complaint-procedure");
            },
            child: TextWidget(
              "2",
              color: Colors.white,
            ),
          ),
          PrimaryButton(
            onTap: () {
              Navigator.pushNamed(context, "report-abuse");
            },
            child: TextWidget(
              "3",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
