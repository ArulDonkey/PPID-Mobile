// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ppid_mobile/components/backgrounded_container.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PpidProfileScreen extends StatefulWidget {
  const PpidProfileScreen({Key? key}) : super(key: key);

  @override
  State<PpidProfileScreen> createState() => _PpidProfileScreenState();
}

class _PpidProfileScreenState extends State<PpidProfileScreen> {
  late var _ytController = YoutubePlayerController();
  final String _videoDescription =
      "Pejabat Pengelola Informasi dan Dokumentasi (PPID) UIN Sunan Gunung Djati Bandung dibentuk dalam rangka memberikan pelayanan Informasi Publik sebagaimana diamanatkan dalam Peraturan Pemerintah Nomor 61 Tahun 2010 tentang Pelaksanaan Undang-Undang Nomor 4 Tahun 2008 tentang Keterbukaan Informasi Publik, Menteri Agama menetapkan Pejabat Pengelola informasi dan Dokumentasi (PPID) melalui Keputusan Menteri Agama (KMA) Nomor 200 Tahun 2012 tentang Pejabat Pengelola Informasi dan Dokumentasi (PPID) Kementerian Agama yang telah diperbaharui menjadi Keputusan Menteri Agama (KMA) Nomor 533 Tahun 2018 tentang Pejabat Pengelola Informasi dan Dokumentasi Kementerian Agama dan Atasan Pejabat Pengelola Informasi dan Dokumentasi Kementerian Agama. Masing-masing PPID pada unit eselon I di lingkungan Kementerian Agama bertanggung jawab untuk melakukan penyediaan, penyimpanan, pendokumentasian, pelayanan, dan pengamanan informasi publik. Atasan PPID merupakan Pimpinan masing-masing unit eselon I.";

  @override
  void initState() {
    _ytController = YoutubePlayerController(
      params: YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    )..onInit = () {
        _ytController.cueVideoById(
          videoId: "yprwfSH4h9c",
        );
      };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
        controller: _ytController,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: _buildAppbar(),
            body: _buildBody(),
          );
        });
  }

  AppBar _buildAppbar() {
    return customAppBar(
      context: context,
    );
  }

  Widget _buildBody() {
    return BackgroundedContainer(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            TextWidget(
              "Profil PPID",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(height: 2),
            TextWidget(
              "UIN Sunan Gunung Djati Bandung",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            _buildYoutubePlayer(),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 50),
              child: TextWidget(
                _videoDescription,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYoutubePlayer() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 14,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: YoutubePlayer(
          controller: _ytController,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
