// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/primary_button.dart';
import 'package:ppid_mobile/components/primary_textfield.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/bloc/auth_bloc.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthBloc _signInBloc = AuthBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signInBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 2,
          colors: [
            Color(0xFF86B5FB),
            Pallete.blue,
          ],
        ),
      ),
      child: Stack(
        children: [
          Scaffold(
            appBar: _buildAppbar(),
            backgroundColor: Colors.transparent,
            body: _buildBody(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              "assets/svgs/auth_decoration.svg",
              width: 120,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(
      context: context,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: TextWidget(
              "Masuk",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextWidget(
            "Selamat Datang!",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextWidget(
            "Silahkan masuk untuk melanjutkan",
            fontSize: 12,
            color: Pallete.disabled,
          ),
        ),
        // SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 28,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    "Surel",
                    fontSize: 14,
                    color: Pallete.darkGrey,
                  ),
                  SizedBox(height: 8),
                  PrimaryTextField(
                    controller: _emailController,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    "Kata sandi",
                    fontSize: 14,
                    color: Pallete.darkGrey,
                  ),
                  SizedBox(height: 8),
                  PrimaryTextField(
                    controller: _passwordController,
                    isPassword: true,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            bloc: _signInBloc,
            builder: (context, state) {
              if (kDebugMode) log("$state");

              if (state is AuthInitialState) {
                return _buildSignInButton();
              } else if (state is SignInLoadingState) {
                return PrimaryButton(
                  width: 150,
                  onTap: () {},
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20,
                  ),
                );
              } else {
                return _buildSignInButton();
              }
            },
            listener: (context, state) {
              if (kDebugMode) log("$state");

              if (state is SignInErrorState) {
                Fluttertoast.showToast(
                  msg: "Terjadi kesalahan, silahkan coba lagi",
                  toastLength: Toast.LENGTH_SHORT,
                );
              }

              if (state is SignInFailedState) {
                Fluttertoast.showToast(
                  msg: state.message,
                  toastLength: Toast.LENGTH_SHORT,
                );
              }

              if (state is SignInSuccessState) {
                // Fluttertoast.showToast(
                //   msg: "Logged in",
                //   toastLength: Toast.LENGTH_SHORT,
                // );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'base',
                  arguments: BaseScreenArgument(index: 0),
                  (route) => false,
                );
              }
            },
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "Belum punya akun? ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                children: [
                  TextSpan(
                    text: "Daftar disini",
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
                        Navigator.pushReplacementNamed(context, "sign-up");
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSignInButton() {
    return PrimaryButton(
      onTap: () async {
        if (_emailController.text == "" || _passwordController.text == "") {
          Fluttertoast.showToast(msg: "Data tidak boleh kosong");
        } else {
          _signInBloc.add(SignInEvent(
            _emailController.text,
            _passwordController.text,
          ));
        }
      },
      contentPadding: EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 10,
      ),
      child: TextWidget(
        "Masuk",
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
