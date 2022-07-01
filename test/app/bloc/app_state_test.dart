import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_wallet/app/app.dart';

class MockUser extends Mock implements User {}

void main() {
  group('AppStates', () {
    group('authenticated', () {
      final user = MockUser();
      final state = AppState.authenticated(user);

      test('Has correct status', () {
        expect(state.status, AppStatus.authenticated);
        expect(state.user, user);
      });
    });

    group('untauthenticated', () {
      const state = AppState.unauthenticated();

      test('Has correct status', () {
        expect(state.status, AppStatus.unauthenticated);
        expect(state.user, User.empty);
      });
    });
  });
}
