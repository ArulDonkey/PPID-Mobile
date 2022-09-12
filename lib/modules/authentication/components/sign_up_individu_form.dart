// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/primary_textfield.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/bloc/auth_bloc.dart';

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
  final AuthBloc _signUpBloc = AuthBloc();
  late File? _fileResult;
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

  @override
  void initState() {
    for (var element in _controllers) {
      element.text = "";
    }
    super.initState();
  }

  @override
  void dispose() {
    _signUpBloc.close();
    super.dispose();
  }

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
              numberOnly: _hints[index] == "Nomor HP" || _hints[index] == "NIK"
                  ? true
                  : false,
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
                        selectFile(index);
                      },
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
                      // _buildButton(),
                      BlocConsumer<AuthBloc, AuthState>(
                        bloc: _signUpBloc,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (kDebugMode) log("$state");

                          if (state is AuthInitialState) {
                            return _buildButton();
                          } else if (state is SignUpIndividuLoadingState) {
                            return SizedBox(
                              width: 150,
                              child: PrimaryButton(
                                onTap: () {},
                                child: LoadingWidget(
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            return _buildButton();
                          }
                        },
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

  Widget _buildButton() {
    return PrimaryButton(
      onTap: () {
        _signUpBloc.add(
          SignUpIndividuEvent(
            _fileResult!.path,
            _nikController.text,
            _emailController.text,
            _nameController.text,
            _phoneController.text,
            _addressController.text,
            _passwordController.text,
            _confirmPasswordController.text,
          ),
        );
      },
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
    );
  }

  selectFile(int index) async {
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
    );

    _fileResult = File(filePicker!.files.single.path!);

    if (_fileResult != null) {
      PlatformFile fileInfo = filePicker.files.first;
      _controllers[index].text = fileInfo.name;
    }
  }
}
