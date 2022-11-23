// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/loading_widget.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/application_request/arguments/application_letter_argument.dart';
import 'package:ppid_mobile/modules/application_request/bloc/application_letter_bloc.dart';
import 'package:ppid_mobile/modules/application_request/component/permohonan/ditindak_lanjuti.dart';
import 'package:ppid_mobile/modules/application_request/models/application_letter.dart';
import 'package:ppid_mobile/modules/application_request/screens/application_detail_screen.dart';

class ApplicationLetterScreen extends StatefulWidget {
  const ApplicationLetterScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationLetterScreen> createState() =>
      _ApplicationLetterScreenState();
}

class _ApplicationLetterScreenState extends State<ApplicationLetterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();
  bool isChecked = false;
  final ApplicationLetterBloc _applicationLetterBloc = ApplicationLetterBloc();
  final ApplicationLetterBloc _postApplicationLetterBloc =
      ApplicationLetterBloc();
  List<ApplicationLetter> _applicationLetters = [];

  @override
  void initState() {
    _applicationLetterBloc.add(GetApplicationLetterEvent());
    super.initState();
  }

  @override
  void dispose() {
    // _detailController.dispose();
    _postApplicationLetterBloc.close();
    _applicationLetterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  AppBar _buildAppbar() {
    return customAppBar(context: context);
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: BlocConsumer<ApplicationLetterBloc, ApplicationLetterState>(
        bloc: _applicationLetterBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ApplicationLetterInitialState) {
            return LoadingWidget();
          } else if (state is ApplicationLetterLoadingState) {
            return LoadingWidget();
          } else if (state is ApplicationLetterEmptyState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: TextWidget(
                  'Anda belum memiliki pengajuan permohonan informasi',
                  fontSize: 14,
                ),
              ),
            );
          } else if (state is ApplicationLetterLoadedState) {
            _applicationLetters = state.list;
            return RefreshIndicator(
              color: Pallete.blue,
              onRefresh: () async {
                _applicationLetterBloc.add(GetApplicationLetterEvent());
              },
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
                      children: List.generate(
                        _applicationLetters.length,
                        (index) {
                          return Column(
                            children: [
                              _buildItem(
                                title: _applicationLetters[index].rincian ?? '',
                                date: _applicationLetters[index]
                                    .dateCreated
                                    .toString(),
                                status: _applicationLetters[index]
                                        .statusPermohonan ??
                                    '',
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return ApplicationDetailScreen(
                                        argument: ApplicationLetterArgument(
                                          _applicationLetters[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     _buildSecond(),
                    //     SizedBox(height: 150),
                    //   ],
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required String date,
    required String status,
    required Function()? onTap,
  }) {
    Color color = Pallete.blue;

    if (status == 'Ditindaklanjuti') {
      color = Pallete.yellow;
    } else if (status == 'Diterima') {
      color = Pallete.lightGreen;
    } else if (status == 'Ditolak') {
      color = Pallete.red;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildDot(color: color),
                    SizedBox(width: 8),
                    Flexible(
                      child: TextWidget(
                        title,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
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
                        text: TextSpan(
                          text: date,
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
                      _buildStatus(
                        text: status,
                        color: color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
                    _buildStatus2(
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
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return _buildForm();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildForm() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _detailController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 12),
                            minLines: 1,
                            maxLines: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Isi form terlebih dahulu';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Rincian Informasi yang dibutuhkan',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _purposeController,
                            style: TextStyle(fontSize: 12),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Isi form terlebih dahulu';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Tujuan Pengaduan',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Pallete.blue,
                          value: isChecked,
                          onChanged: (checked) {
                            setState(() {
                              isChecked = checked!;
                            });
                          },
                        ),
                        Expanded(
                          child: TextWidget(
                            'Dengan mengisi form ini saya telah memahami dan menyetujui persyaratan permohonan informasi publik sesuai dengan ketentuan yang berlaku.',
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildElevatedButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDot({Color? color}) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: color,
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

  Widget _buildStatus({required String text, Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: TextWidget(
        text,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStatus2({
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
      primary: isChecked ? Colors.green : Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(left: 180),
      child: BlocConsumer<ApplicationLetterBloc, ApplicationLetterState>(
        bloc: _postApplicationLetterBloc,
        listener: (context, state) {
          if (state is PostApplicationLetterSuccessState) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/accept.png', height: 80),
                    SizedBox(height: 20),
                    TextWidget(
                      'Pengajuan berhasil ditambahkan',
                      textAlign: TextAlign.center,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );

            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
              Navigator.pop(context);
              _applicationLetterBloc.add(GetApplicationLetterEvent());
            });
          } else if (state is PostApplicationLetterErrorState) {
            Fluttertoast.showToast(
              msg: 'Terjadi kesalahan, silahkan coba lagi',
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
        builder: (context, state) {
          if (state is ApplicationLetterInitialState) {
            return ElevatedButton(
              onPressed: () {
                if (!isChecked) {
                } else {
                  if (_formKey.currentState!.validate()) {
                    _postApplicationLetterBloc.add(
                      PostApplicationLetterEvent(
                        detail: _detailController.text,
                        purpose: _purposeController.text,
                        statement: 'Setuju',
                      ),
                    );
                  }
                }
              },
              style: style,
              child: Row(
                children: [
                  TextWidget(
                    'Ajukan',
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  SvgPicture.asset('assets/svgs/ajukan.svg'),
                ],
              ),
            );
          } else if (state is PostApplicationLetterLoadingState) {
            return LoadingWidget(
              size: 20,
            );
          }
          return ElevatedButton(
            onPressed: () {
              if (!isChecked) {
              } else {
                if (_formKey.currentState!.validate()) {
                  _postApplicationLetterBloc.add(
                    PostApplicationLetterEvent(
                      detail: _detailController.text,
                      purpose: _purposeController.text,
                      statement: 'Setuju',
                    ),
                  );
                }
              }
            },
            style: style,
            child: Row(
              children: [
                TextWidget(
                  'Ajukan',
                  color: Colors.white,
                ),
                SizedBox(width: 4),
                SvgPicture.asset('assets/svgs/ajukan.svg'),
              ],
            ),
          );
        },
      ),
    );
  }
}
