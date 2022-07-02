import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_wallet/app/app.dart';
import 'package:my_wallet/home/home.dart';
import 'package:my_wallet/theme/theme.dart';

class MockUser extends Mock implements User {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockThemeCubit extends MockCubit<ThemeData> implements ThemeCubit {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

void main() {
  group('App', () {
    late AuthenticationRepository authenticationRepository;
    late User user;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      user = MockUser();

      when(() => authenticationRepository.user)
          .thenAnswer((invocation) => const Stream.empty());

      when(() => authenticationRepository.currentUser).thenReturn(user);

      when(() => user.isNotEmpty).thenReturn(true);

      when(() => user.isEmpty).thenReturn(false);

      when(() => user.email).thenReturn('rahmadfani.42@gmail.com');
    });

    testWidgets('Render AppView', (tester) async {
      await tester
          .pumpWidget(App(authenticationRepository: authenticationRepository));
      await tester.pump();
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    late ThemeCubit themeCubit;
    late AppBloc appBloc;
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      themeCubit = MockThemeCubit();
      appBloc = MockAppBloc();

      when(
        () => themeCubit.state,
      ).thenReturn(ThemeData());
    });
    testWidgets('Navigate to HomePage initial', (tester) async {
      when(() => appBloc.state).thenReturn(const AppState.unauthenticated());

      await tester.pumpWidget(RepositoryProvider.value(
        value: authenticationRepository,
        child: MultiBlocProvider(providers: [
          BlocProvider<AppBloc>.value(value: appBloc),
          BlocProvider<ThemeCubit>.value(value: themeCubit)
        ], child: const AppView()),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
