import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/app/app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final authenticationRepository = AuthenticationRepository();
      // await authenticationRepository.user.first;
      runApp(App(authenticationRepository: authenticationRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
