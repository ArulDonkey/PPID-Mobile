// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/application_request/component/permohonan/diajukan.dart';
import 'package:ppid_mobile/modules/application_request/component/permohonan/ditindak_lanjuti.dart';

class ApplicationLetterScreen extends StatefulWidget {
  const ApplicationLetterScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationLetterScreen> createState() =>
      _ApplicationLetterScreenState();
}

class _ApplicationLetterScreenState extends State<ApplicationLetterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(context: context);
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
              child: TextWidget(
                "Permohonan Informasi",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Container(),
            Column(
              children: [
                _buildFirst(),
                SizedBox(height: 40),
              ],
            ),
            Column(
              children: [
                _buildSecond(),
                SizedBox(height: 150),
              ],
            ),
            Column(
              children: [
                _buildFloatingButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirst() {
    final List<String> content = [
      'Informasi beasiswa bagi mahasiswa\nsemester akhir',
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 5),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Column(
            children: List.generate(content.length, (index) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBlueDot(),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextWidget(
                      content[index],
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: RichText(
                      text: const TextSpan(
                        text: '07/10/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    _buildButton(
                      text: 'Diajukan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PermohonanDiajukan(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecond() {
    final List<String> content2 = [
      'Informasi lowongan pekerjaan di UIN\nSunan Gunung Djati Bandung'
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Pallete.componentShadow,
            offset: Offset(0, 5),
            spreadRadius: .2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Column(
            children: List.generate(content2.length, (index) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBlueDot2(),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextWidget(
                      content2[index],
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: RichText(
                      text: const TextSpan(
                        text: '01/10/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    _buildButton2(
                      text: 'Ditindaklanjuti',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PermohonanDitindakLanjuti(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            FloatingActionButton(
              onPressed: () => showDialog(
                context: context,
                builder: (
                  context,
                ) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 140, 10, 140),
                        child: Material(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  _textEditingController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 4,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Isi form terlebih dahulu';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                hintText:
                                                    'Rincian Informasi yang dibutuhkan',
                                                hintStyle: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 4,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Isi form terlebih dahulu';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                hintText: 'Tujuan Pengaduan',
                                                hintStyle: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (checked) {
                                              setState(() {
                                                isChecked = checked!;
                                              });
                                            },
                                          ),
                                          TextWidget(
                                            'Dengan mengisi form ini saya telah memahami dan menyetujui\npersyaratan permohonan informasi publik sesuai dengan ketentuan yang berlaku.',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 5,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                      _buildElevatedButton(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBlueDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Pallete.blue,
      ),
    );
  }

  Widget _buildBlueDot2() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Pallete.yellow,
      ),
    );
  }

  Widget _buildButton({
    required Function() onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Pallete.blue,
        ),
        child: TextWidget(
          text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildButton2({
    required Function() onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Pallete.yellow,
        ),
        child: TextWidget(
          text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildElevatedButton() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      primary: isChecked ? Colors.green : Colors.grey,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 185),
      child: ElevatedButton(
        onPressed: () {
          if (!isChecked) {
          } else {
            if (_formKey.currentState!.validate()) ;
            {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/accept.png', height: 80),
                      SizedBox(height: 20),
                      Text(
                        'Pengajuan berhasil ditambahkan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
        style: style,
        child: Row(
          children: [
            Text('Ajukan'),
            SvgPicture.asset('assets/svgs/ajukan.svg'),
          ],
        ),
      ),
    );
  }
}
