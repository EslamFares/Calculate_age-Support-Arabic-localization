import 'package:flutter/material.dart';
import 'package:localization_setting/pages/about_page.dart';
import 'package:localization_setting/pages/home_page.dart';
import 'package:localization_setting/pages/not_found_page.dart';
import 'package:localization_setting/pages/settings_page.dart';
import 'package:localization_setting/routes/route_names.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Homepage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => Settingpage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => Aboutpage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundpage());
  }
}
