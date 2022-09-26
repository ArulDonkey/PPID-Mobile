import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/screens/base_screen.dart';
import 'package:ppid_mobile/screens/onboarding/data.dart';
import 'package:ppid_mobile/screens/onboarding/onboarding_page.dart';
import 'package:ppid_mobile/screens/onboarding/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
                'assets/svgs/onboarding_1.svg',
                height: 300,
              ),
              SizedBox(
                height: sizeV * 5,
              ),
              Center(
                child: TextWidget(
                  'Gunakan PPID Untuk Memudahkan Anda\nMendapatkan Semua Informasi\nTentang UIN Sunan Gunung Djati Bandung',
                  color: Colors.white,
                  fontSize: 15,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OnBoardNavBtn(
                      name: 'Lewati',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BaseScreen()),
                        );
                      },
                    ),
                    OnBoardNavBtn(
                      name: 'Selanjutnya',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          child: Text(
            name,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
