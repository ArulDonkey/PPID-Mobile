import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/text_widget.dart';

class DeleteLaterScreen extends StatelessWidget {
  const DeleteLaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryButton(
              onTap: () => Navigator.pushNamed(context, "sign-in"),
              child: TextWidget(
                "Sign In Screen",
                color: Colors.white,
              ),
            ),
            PrimaryButton(
              onTap: () => Navigator.pushNamed(context, "sign-up"),
              child: TextWidget(
                "Sign Up Screen",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
