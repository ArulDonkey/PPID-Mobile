// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppid_mobile/components/custom_appbar.dart';
import 'package:ppid_mobile/components/text_widget.dart';
import 'package:ppid_mobile/configs/pallete.config.dart';
import 'package:ppid_mobile/modules/authentication/components/sign_up_individu_form.dart';
import 'package:ppid_mobile/modules/authentication/components/sign_up_lembaga_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = [
    Tab(
      child: TextWidget(
        "Individu",
        fontSize: 12,
      ),
    ),
    Tab(
      child: TextWidget(
        "Badan/Lembaga",
        fontSize: 12,
      ),
    ),
  ];

  final List<Widget> _tabViews = [
    SignUpIndividuForm(),
    SignUpLembagaForm(),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
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

  Widget _buildSliverAppbar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: Container(),
      toolbarHeight: 220,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 45),
        title: Column(
          children: [
            TextWidget(
              "Daftar",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            SizedBox(height: 24),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextWidget(
                        "Selamat datang!",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextWidget(
                        "Silahkan daftar untuk melanjutkan",
                        fontSize: 12,
                        color: Pallete.disabled,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: _buildSliverAppbar(),
          ),
        ];
      },
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          tabs: _tabs,
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _tabViews,
          ),
        ),
      ],
    );
  }
}
