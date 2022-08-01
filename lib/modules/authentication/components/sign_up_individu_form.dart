// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/primary_textfield.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';

final TextEditingController _fileKtpController = TextEditingController();
final TextEditingController _nikController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();

class SignUpIndividuForm extends StatefulWidget {
  const SignUpIndividuForm({Key? key}) : super(key: key);

  @override
  State<SignUpIndividuForm> createState() => _SignUpIndividuFormState();
}

class _SignUpIndividuFormState extends State<SignUpIndividuForm> {
  final List<TextEditingController> _controllers = [
    _fileKtpController,
    _nikController,
    _emailController,
    _nameController,
    _phoneController,
    _addressController,
    _passwordController,
    _confirmPasswordController,
  ];

  final List<String> _hints = [
    "File KTP",
    "NIK",
    "Surel",
    "Nama Lengkap",
    "Nomor HP",
    "Alamat",
    "Kata Sandi",
    "Konfirmasi Kata Sandi",
  ];

  // @override
  // void dispose() {
  //   for (int i = 0; i < _controllers.length; i++) {
  //     _controllers[i].dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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
              controller: _controllers[index],
              hintText: _hints[index],
              numberOnly: _hints[index] == "Nomor HP" ? true : false,
              isPassword: _hints[index] == "Kata Sandi" ||
                      _hints[index] == "Konfirmasi Kata Sandi"
                  ? true
                  : false,
              minLines: 1,
              maxLines: _hints[index] == "Kata Sandi" ||
                      _hints[index] == "Konfirmasi Kata Sandi"
                  ? 1
                  : 3,
              readOnly: index > 0 ? false : true,
              suffixIcon: index > 0
                  ? null
                  : PrimaryButton(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        );

                        if (result != null) {
                          // File file = File(result.files.single.path!);
                          PlatformFile fileInfo = result.files.first;

                          _controllers[index].text = fileInfo.name;
                        }
                      },
                      // borderRadius: 0,
                      backgroundColor: Pallete.blue,
                      child: TextWidget(
                        "Unggah",
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
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
                                  Navigator.pushReplacementNamed(
                                      context, "sign-in");
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
