import 'package:flutter/material.dart';
import 'package:my_wallet/home/view/home_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final Map<String, WidgetBuilder> pages = {
    Routes.INITIAL: (context) => const HomePage(),
  };
}
