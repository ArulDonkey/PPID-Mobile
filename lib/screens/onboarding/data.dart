import 'package:flutter/material.dart';

class Onboarding {
  final String title;
  final String decs;
  final String svg;
  final String logo;

  Onboarding({
    required this.title,
    required this.decs,
    required this.svg,
    required this.logo,
  });
}

List<Onboarding> onboardingContents = [
  Onboarding(
    logo: 'assets/images/ppid_logo.png',
    title: 'Informasi Wajib Berkala',
    decs:
        'informasi yang  wajib diperbaharui kemudian\ndisediakan dan diumumkan kepada publik \nsecara rutin  atau berkala sekurang-kurangnya\nsetiap 6 bulan sekali',
    svg: 'assets/svgs/onboarding_2.svg',
  ),
  Onboarding(
    logo: 'assets/images/ppid_logo.png',
    title: 'Informasi Wajib Tersedia\nSetiap Saat',
    decs:
        'Informasi yang harus disediakan oleh Badan Publik\ndan siap tersedia setiap saat untuk bisa langsung\ndiberikan kepada Pemohon Informasi Publik\nketika terdapat permohonan terhadap\nInformasi Publik tersebut.',
    svg: 'assets/svgs/onboarding_3.svg',
  ),
  Onboarding(
    logo: 'assets/images/ppid_logo.png',
    title: 'Informasi Wajib Diumumkan\nSerta Merta',
    decs:
        ' informasi yang berkaitan dengan  hajat hidup\norang banyak dan ketertiban umum dan wajib\ndiumumkan secara serta merta tanpa penundaan.',
    svg: 'assets/svgs/onboarding_4.svg',
  ),
];
