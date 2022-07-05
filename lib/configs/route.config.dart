// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ppid_mobile/modules/news/arguments/news_detail_screen_argument.dart';
import 'package:ppid_mobile/modules/news/arguments/news_list_screen_argument.dart';
import 'package:ppid_mobile/modules/news/screens/news_detail_screen.dart';
import 'package:ppid_mobile/modules/news/screens/news_list_screen.dart';
import 'package:ppid_mobile/screens/base_screen.dart';
import 'package:ppid_mobile/screens/not_found_screen.dart';

class RouteConfig {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/base":
        return _buildRoute(
          settings,
          BaseScreen(),
        );
      case "/news-detail":
        return _buildRoute(
          settings,
          NewsDetailScreen(
            argument: settings.arguments as NewsDetailScreenArgument,
          ),
        );
      case "/news-list":
        return _buildRoute(
          settings,
          NewsListScreen(
            argument: settings.arguments as NewsListScreenArgument,
          ),
        );

      default:
    }

    return _buildRoute(settings, NotFoundScreen());
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: settings,
    );
  }
}
