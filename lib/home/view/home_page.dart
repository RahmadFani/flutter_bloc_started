import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.status == AppStatus.unauthenticated) {
            return const Center(child: Text('Unauthenticated'));
          }
          return Center(child: Text(state.user.name ?? ""));
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<AuthenticationRepository>().login();
            },
            child: const Icon(Icons.login),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
            child: const Icon(Icons.logout),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            key: const Key('homePage_changeTheme_floatingActionButton'),
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
            },
            child: const Icon(Icons.change_circle),
          )
        ],
      ),
    );
  }
}
