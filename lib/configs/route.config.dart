// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/modules/about/arguments/about_webview_screen_argument.dart';
import 'package:ppid_mobile/modules/about/screens/about_webview_screen.dart';
import 'package:ppid_mobile/modules/about/screens/notice_screen.dart';
import 'package:ppid_mobile/modules/about/screens/ppid_profile_screen.dart';
import 'package:ppid_mobile/modules/about/screens/regulation_screen.dart';
import 'package:ppid_mobile/modules/about/screens/visi_misi_screen.dart';
import 'package:ppid_mobile/modules/application_request/screens/application_complaint_screen.dart';
import 'package:ppid_mobile/modules/application_request/screens/application_letter_screen.dart';
import 'package:ppid_mobile/modules/application_request/screens/application_objection_screen.dart';
import 'package:ppid_mobile/modules/authentication/screens/sign_in_screen.dart';
import 'package:ppid_mobile/modules/authentication/screens/sign_up_screen.dart';
import 'package:ppid_mobile/modules/information/arguments/information_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/information/arguments/information_list_screen_argument.dart';
import 'package:ppid_mobile/modules/information/screens/information_detail_screen.dart';
import 'package:ppid_mobile/modules/information/screens/information_list_screen.dart';
import 'package:ppid_mobile/modules/news/arguments/news_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/screens/news_detail_screen.dart';
import 'package:ppid_mobile/modules/news/screens/news_list_screen.dart';
import 'package:ppid_mobile/modules/service/screens/report_abuse_screen.dart';
import 'package:ppid_mobile/modules/service/screens/request_complaint_procedure_screen.dart';
import 'package:ppid_mobile/modules/service/screens/request_information_procedure_screen.dart';
import 'package:ppid_mobile/screens/base_screen.dart';
import 'package:ppid_mobile/screens/base_screen_argument.dart';
import 'package:ppid_mobile/screens/not_found_screen.dart';
import 'package:ppid_mobile/screens/splash_screen.dart';
import 'package:ppid_mobile/screens/under_construction_screen.dart';

class RouteConfig {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return _buildRoute(settings, SplashScreen());
      case "base":
        return _buildRoute(
          settings,
          BaseScreen(
            argument: settings.arguments as BaseScreenArgument,
          ),
        );
      case "news-detail":
        return _buildRoute(
          settings,
          NewsDetailScreen(
            argument: settings.arguments as NewsDetailScreenArgument,
          ),
        );
      case "news-list":
        return _buildRoute(
          settings,
          NewsListScreen(
            argument: settings.arguments as NewsListScreenArgument,
          ),
        );
      case "application-letter":
        return _buildRoute(
          settings,
          ApplicationLetterScreen(),
        );
      case "application-objection":
        return _buildRoute(
          settings,
          ApplicationObjectionScreen(),
        );
      case "application-complaint":
        return _buildRoute(
          settings,
          ApplicationComplaintScreen(),
        );
      case "information-list":
        return _buildRoute(
          settings,
          InformationListScreen(
            argument: settings.arguments as InformationListScreenArgument,
          ),
        );
      case "information-detail":
        return _buildRoute(
          settings,
          InformationDetailScreen(
            argument: settings.arguments as InformationDetailScreenArgument,
          ),
        );
      case "sign-in":
        return _buildRoute(
          settings,
          SignInScreen(),
        );
      case "sign-up":
        return _buildRoute(
          settings,
          SignUpScreen(),
        );
      case "request-information-procedure":
        return _buildRoute(
          settings,
          RequestInformationProcedureScreen(),
        );
      case "request-complaint-procedure":
        return _buildRoute(
          settings,
          RequestComplaintProcedureScreen(),
        );
      case "report-abuse":
        return _buildRoute(
          settings,
          ReportAbuseScreen(),
        );
      case "ppid-profile":
        return _buildRoute(
          settings,
          PpidProfileScreen(),
        );
      case "notice":
        return _buildRoute(
          settings,
          NoticeScreen(),
        );
      case "visi-misi":
        return _buildRoute(
          settings,
          VisiMisiScreen(),
        );
      case "about-webview":
        return _buildRoute(
          settings,
          AboutWebviewScreen(
            argument: settings.arguments as AboutWebviewScreenArgument,
          ),
        );
      case "regulation":
        return _buildRoute(
          settings,
          RegulationScreen(),
        );
      case 'under-construction':
        return _buildRoute(settings, UnderConstructionScreen());

      default:
        return _buildRoute(settings, NotFoundScreen());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: settings,
    );
  }
}
