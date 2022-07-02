import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/home/home.dart';
import 'package:my_wallet/theme/theme.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockUser extends Mock implements User {}

class MockThemeCubit extends MockCubit<ThemeData> implements ThemeCubit {}

void main() {
  const changeThemeButtonKey = Key('homePage_changeTheme_floatingActionButton');

  group('HomePage', () {
    late User user;
    late MockAppBloc appBloc;
    late ThemeCubit themeCubit;

    setUp(() {
      user = MockUser();
      appBloc = MockAppBloc();
      themeCubit = MockThemeCubit();
    });

    group('calls', () {
      testWidgets('change theme when button is pressed', (tester) async {
        when(() => appBloc.state).thenReturn(const AppState.unauthenticated());
        when(
          () => themeCubit.state,
        ).thenReturn(ThemeData.light());

        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<AppBloc>.value(
                  value: appBloc,
                ),
                BlocProvider<ThemeCubit>.value(value: themeCubit)
              ],
              child: const HomePage(),
            ),
          ),
        );
        await tester.tap(find.byKey(changeThemeButtonKey));
        await tester.pump();
        verify(() => themeCubit.changeTheme()).called(1);
      });
    });

    group('renders', () {
      setUp(() {
        user = MockUser();
        appBloc = MockAppBloc();
      });
      testWidgets('Render HomePage Unauthenticacted', (tester) async {
        when(() => appBloc.state).thenReturn(const AppState.unauthenticated());
        await tester.pumpWidget(MaterialApp(
          home: BlocProvider<AppBloc>.value(
              value: appBloc, child: const HomePage()),
        ));

        expect(find.text('Unauthenticated'), findsOneWidget);
      });

      testWidgets('Render HomePage Authenticated', (tester) async {
        when(() => user.isEmpty).thenReturn(false);
        when(() => user.isNotEmpty).thenReturn(true);
        when(() => user.name).thenReturn('Fani');
        when(() => appBloc.state).thenReturn(AppState.authenticated(user));
        await tester.pumpWidget(MaterialApp(
          home: BlocProvider<AppBloc>.value(
              value: appBloc, child: const HomePage()),
        ));

        expect(find.text('Fani'), findsOneWidget);
      });
    });
  });
}
