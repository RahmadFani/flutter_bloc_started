import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<ThemeCubit>(create: (_) => ThemeCubit())],
        child: const AppView());
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (ctx, theme) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: Routes.INITIAL,
        routes: AppPages.pages,
      );
    });
  }
}
