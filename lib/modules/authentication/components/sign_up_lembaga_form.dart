// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/primary_textfield.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/bloc/auth_bloc.dart';

class SignUpLembagaForm extends StatefulWidget {
  const SignUpLembagaForm({Key? key}) : super(key: key);

  @override
  State<SignUpLembagaForm> createState() => _SignUpLembagaFormState();
}

final TextEditingController _fileKtpController = TextEditingController();
final TextEditingController _fileSkController = TextEditingController();
final TextEditingController _fileSkNegaraController = TextEditingController();
final TextEditingController _fileAdArtController = TextEditingController();
final TextEditingController _nikController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();

class _SignUpLembagaFormState extends State<SignUpLembagaForm> {
  final AuthBloc _signUpBloc = AuthBloc();
  final List<File> _fileResults = [File(''), File(''), File(''), File('')];

  final List<TextEditingController> _controllers = [
    _fileKtpController,
    _fileSkController,
    _fileSkNegaraController,
    _fileAdArtController,
    _nikController,
    _emailController,
    _nameController,
    _phoneController,
    _addressController,
    _passwordController,
    _confirmPasswordController
  ];

  final List<String> _hints = [
    "File KTP",
    "File Surat Kuasa",
    "File Surat Kuasa Negara",
    "File AD/ART",
    "NIK",
    "Surel",
    "Nama Lengkap",
    "Nomor HP",
    "Alamat",
    "Kata Sandi",
    "Konfirmasi Kata Sandi"
  ];

  @override
  void initState() {
    for (var item in _controllers) {
      item.text = '';
    }

    for (var item in _fileResults) {
      item = File('');
    }

    super.initState();
  }

  @override
  void dispose() {
    // for (var item in _controllers) {
    //   item.dispose();
    // }
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
              hintText: _hints[index],
              controller: _controllers[index],
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
              readOnly: index != 0 ? false : true,
              suffixIcon: index != 0 && index != 1 && index != 2 && index != 3
                  ? null
                  : GestureDetector(
                      onTap: () async {
                        selectFile(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 14,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Pallete.blue,
                          ),
                          child: TextWidget(
                            "Unggah",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),
            index == 10
                ? Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: Pallete.blue,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextWidget(
                              'Kata sandi harus mengandung minimal 8 karakter, 1 huruf kecil, 1 huruf besar, 1 nomor, dan 1 simbol',
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            index == _hints.length - 1
                ? Column(
                    children: [
                      SizedBox(height: 36),
                      BlocConsumer<AuthBloc, AuthState>(
                        bloc: _signUpBloc,
                        listener: (context, state) {
                          if (state is SignUpLembagaSuccessState) {
                            Fluttertoast.showToast(
                              msg:
                                  'Berhasil daftar\nSilahkan tunggu untuk aktivasi akun anda oleh admin',
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }

                          if (state is SignUpLembagaFailedState) {
                            Fluttertoast.showToast(
                              msg: state.message,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }

                          if (state is SignUpLembagaErrorState) {
                            Fluttertoast.showToast(
                              msg: 'Terjadi kesalahan, silahkan coba lagi',
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (kDebugMode) log('$state');

                          if (state is AuthInitialState) {
                            return _buildButton();
                          } else if (state is SignUpLembagaLoadingState) {
                            return PrimaryButton(
                              width: 150,
                              onTap: () {},
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20,
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
        if (_fileResults[0].path == '' ||
            _fileResults[1].path == '' ||
            _fileResults[2].path == '' ||
            _fileResults[3].path == '' ||
            _nikController.text == '' ||
            _emailController.text == '' ||
            _nameController.text == '' ||
            _phoneController.text == '' ||
            _addressController.text == '' ||
            _passwordController.text == '' ||
            _confirmPasswordController.text == '') {
          Fluttertoast.showToast(msg: "Data tidak boleh kosong");
        } else {
          if (_passwordController.text != _confirmPasswordController.text) {
            Fluttertoast.showToast(msg: "Kata sandi tidak cocok");
          } else {
            _signUpBloc.add(
              SignUpLembagaEvent(
                ktpPath: _fileResults[0].path,
                skPath: _fileResults[1].path,
                skNegaraPath: _fileResults[2].path,
                adartPath: _fileResults[3].path,
                nik: _nikController.text,
                email: _emailController.text,
                name: _nameController.text,
                phoneNumber: _phoneController.text,
                address: _addressController.text,
                password: _passwordController.text,
                confirmPassword: _confirmPasswordController.text,
              ),
            );
          }
        }
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
    var _result = File(filePicker!.files.single.path!);
    var _fileSizeInBytes = _result.lengthSync();
    var _fileSizeInMb = _fileSizeInBytes / (1024 * 1024);

    if (_fileSizeInMb > 2) {
      Fluttertoast.showToast(
        msg: 'Ukuran berkas maksimal 2mb',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      _fileResults[index] = _result;
      PlatformFile fileInfo = filePicker.files.first;
      log('index: $index, file: ${_fileResults[index]}');
      log('list: $_fileResults');

      _controllers[index].text = fileInfo.name;
    }
  }
}
