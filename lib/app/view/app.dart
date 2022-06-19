import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/theme/theme.dart';

class App extends StatelessWidget {
  const App(
      {Key? key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(providers: [
        BlocProvider<AppBloc>(
            create: (_) =>
                AppBloc(authenticationRepository: _authenticationRepository)),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ], child: const AppView()),
    );
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
