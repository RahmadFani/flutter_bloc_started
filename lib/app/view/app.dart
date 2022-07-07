import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/cart/cart.dart';
import 'package:my_wallet/location/cubit/location_cubit.dart';
import 'package:my_wallet/product/cubit/product_cubit.dart';
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
        BlocProvider<ProductCubit>(create: (_) => ProductCubit()..init()),
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        BlocProvider<LocationCubit>(create: (_) => LocationCubit()),
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
        title: 'Flutter Shop',
        theme: theme,
        initialRoute: Routes.INITIAL,
        routes: AppPages.pages,
      );
    });
  }
}
