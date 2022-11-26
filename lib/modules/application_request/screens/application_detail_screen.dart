// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/application_request/arguments/application_letter_argument.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDetailScreen extends StatefulWidget {
  ApplicationLetterArgument argument;
  ApplicationDetailScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<ApplicationDetailScreen> createState() =>
      _ApplicationDetailScreenState();
}

class _ApplicationDetailScreenState extends State<ApplicationDetailScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildDetailContainer(
              date: widget.argument.applicationLetter.dateCreated.toString(),
              detail: widget.argument.applicationLetter.rincian ?? '',
              purpose: widget.argument.applicationLetter.tujuan ?? '',
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 8),
              child: TextWidget(
                'Status',
                fontWeight: FontWeight.w700,
              ),
            ),
            _buildStatusContainer(
              status: widget.argument.applicationLetter.statusPermohonan ?? '',
              followUp: widget.argument.applicationLetter.jawaban ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlow({required String status}) {
    List<Color> colors = [
      Pallete.lightGreen,
      Pallete.darkGrey,
      Pallete.darkGrey
    ];
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 1.5,
              color: Pallete.darkGrey,
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(colors.length, (index) {
            if (status == 'Ditindaklanjuti') {
              for (int i = 1; i < colors.length - 1; i++) {
                colors[i] = Pallete.lightGreen;
              }
            } else if (status == 'Disetujui') {
              for (int i = 1; i < colors.length; i++) {
                colors[i] = Pallete.lightGreen;
              }
            } else if (status == 'Ditolak') {
              for (int i = 1; i < colors.length; i++) {
                colors[i] = Pallete.lightGreen;
                colors[colors.length - 1] = Pallete.red;
              }
            }
            return Container(
              padding: EdgeInsets.all(
                index == 1
                    ? 7
                    : index == 2
                        ? 6
                        : 8,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[index],
              ),
              child: TextWidget(
                ' ${index + 1} ',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStatusContainer({required String status, String? followUp}) {
    String description = '';

    if (status == 'Diajukan') {
      description = 'Menunggu\npersetujuan admin';
    } else if (status == 'Ditindaklanjuti') {
      description = 'Permohonan sedang\nditindaklanjuti';
    } else if (status == 'Disetujui') {
      description = 'Permohonan disetujui';
    } else if (status == 'Ditolak') {
      description = 'Permohonan ditolak';
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 24),
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
            crossAxisAlignment: status == 'Diajukan'
                ? CrossAxisAlignment.start
                : status == 'Ditindaklanjuti'
                    ? CrossAxisAlignment.center
                    : status == 'Disetujui' || status == 'Ditolak'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.end,
            children: [
              _buildFlow(status: status),
              SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: status == 'Disetujui'
                      ? 24
                      : status == 'Ditolak'
                          ? 30
                          : 32,
                ),
                child: Column(
                  children: [
                    TextWidget(
                      status,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    TextWidget(
                      description,
                      textAlign: TextAlign.center,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
              TextWidget(
                'Tindak Lanjut Permohonan',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              Html(
                data: followUp,
                renderNewlines: true,
                onLinkTap: (url) {
                  launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailContainer({
    required String date,
    required String detail,
    required String purpose,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(36),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Tanggal Pengajuan',
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 2),
              TextWidget(
                date,
                fontSize: 12,
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Rincian',
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 2),
              TextWidget(
                detail,
                fontSize: 12,
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Tujuan',
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 2),
              TextWidget(
                purpose,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
