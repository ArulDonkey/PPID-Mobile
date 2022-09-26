import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';
import 'package:ppid_mobile/screens/onboarding/data.dart';
import 'package:ppid_mobile/screens/onboarding/size_config.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);
  final PpidSharedPreferences _preferences = PpidSharedPreferences();

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
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingContents.length,
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: ((context, index) => Column(
                        children: [
                          SizedBox(
                            height: sizeV * 4,
                          ),
                          Image.asset(
                            onboardingContents[index].logo,
                            height: sizeV * 7,
                          ),
                          SizedBox(
                            height: sizeV * 8,
                          ),
                          SvgPicture.asset(
                            onboardingContents[index].svg,
                            height: sizeV * 35,
                          ),
                          SizedBox(
                            height: sizeV * 3,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(30),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: SmoothPageIndicator(
                                      controller: _pageController,
                                      count: 3,
                                      effect: ExpandingDotsEffect(
                                        dotHeight: 10,
                                        dotWidth: 8,
                                        dotColor:
                                            Color.fromARGB(255, 166, 166, 167),
                                        activeDotColor:
                                            Color.fromARGB(255, 27, 33, 58),
                                      ),
                                      onDotClicked: (index) {},
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: sizeV * 2,
                                      ),
                                      TextWidget(
                                        onboardingContents[index].title,
                                        textAlign: TextAlign.center,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: sizeV * 2,
                                        color: Color.fromARGB(255, 27, 33, 58),
                                      ),
                                      SizedBox(
                                        height: sizeV * 1.5,
                                      ),
                                      TextWidget(
                                        onboardingContents[index].decs,
                                        textAlign: TextAlign.center,
                                        fontStyle: FontStyle.normal,
                                        fontSize: sizeV * 1.5,
                                        color: Color.fromARGB(255, 27, 33, 58),
                                      ),
                                    ],
                                  ),
                                  _buildPictur(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPictur() {
    return Column(
      children: [
        _currentPage == onboardingContents.length - 1
            ? MyTextButton(
                buttonName: 'Mulai',
                onPressed: () {
                  _preferences.setFirstLaunchValue(false);
                  Navigator.pushNamed(
                    context,
                    'base',
                    arguments: BaseScreenArgument(index: 0),
                  );
                },
                bgColor: Color.fromARGB(255, 27, 33, 58),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('assets/svgs/next.svg'),
                            iconSize: 5,
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(buttonName),
              ],
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              fixedSize: Size(150, 10),
              textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              primary: Color.fromARGB(255, 27, 33, 58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
