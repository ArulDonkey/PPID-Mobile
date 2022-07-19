// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/primary_textfield.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

class SignUpLembagaForm extends StatelessWidget {
  const SignUpLembagaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _hints = [
      "File KTP",
      "File Surat Kuasa",
      "File AD/ART",
      "NIK",
      "Surel",
      "Nama Lengkap",
      "Nomor HP",
      "Alamat",
      "Kata Sandi",
      "Konfirmasi Kata Sandi",
    ];

    return ListView.separated(
      // primary: false,
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            PrimaryTextField(
              hintText: _hints[index],
            ),
            index == _hints.length - 1
                ? Column(
                    children: [
                      SizedBox(height: 36),
                      PrimaryButton(
                        onTap: () {},
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 56,
                          vertical: 8,
                        ),
                        child: TextWidget(
                          "Daftar",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 36),
                      RichText(
                        text: TextSpan(
                          text: "Sudah punya akun? ",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text: "Masuk disini",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Pallete.blue,
                                  fontSize: 10,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                ),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, "sign-in");
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: _hints.length,
    );
  }
}
