import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/screens/sign_in_screen.dart';
import 'package:ppid_mobile/modules/authentication/screens/sign_up_screen.dart';
import 'package:ppid_mobile/screens/onboarding/size_config.dart';

class signup_signin extends StatefulWidget {
  const signup_signin({Key? key}) : super(key: key);

  @override
  State<signup_signin> createState() => _signup_signinState();
}

class _signup_signinState extends State<signup_signin> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment(0, 0.1),
              colors: [
                Color(0xFF86B5FB),
                Pallete.blue,
              ]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: sizeV * 5,
              ),
              Image.asset(
                'assets/images/ppid_logo.png',
                height: 50,
              ),
              SizedBox(
                height: sizeV * 10,
              ),
              SvgPicture.asset(
                'assets/svgs/onboarding_5.svg',
                height: 300,
              ),
              SizedBox(
                height: sizeV * 5,
              ),
              Center(
                child: TextWidget(
                  'Selamat Datang !',
                  color: Colors.white,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: 'Untuk melanjutkan silahkan \n'),
                    TextSpan(
                        text: 'masuk ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: 'atau '),
                    TextSpan(
                        text: 'daftar ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: 'terlebih dahulu')
                  ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ButtonStyle(
                name: 'Masuk',
                onPressed: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignInScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              ButtonStyle(
                name: 'Daftar',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUpScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonStyle extends StatelessWidget {
  const ButtonStyle({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
        ],
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        fixedSize: Size(350, 50),
        onPrimary: Colors.white,
        shadowColor: Colors.white,
        side: BorderSide(color: Colors.white, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
