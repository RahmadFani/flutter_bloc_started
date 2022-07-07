import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/home/view/home_page.dart';
import 'package:my_wallet/splash/view/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final Map<String, WidgetBuilder> pages = {
    Routes.INITIAL: (context) =>
        BlocBuilder<AppBloc, AppState>(builder: (_, state) {
          if (state.status == AppStatus.initializing) {
            return const SplashPage();
          }
          return const HomePage();
        }),
  };
}
