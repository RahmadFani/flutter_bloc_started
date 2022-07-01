import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_wallet/app/app.dart';

class MockUser extends Mock implements User {}

void main() {
  group('AppEvents', () {
    group('AppUserChanged', () {
      final user = MockUser();
      final event = AppUserChanged(user);

      test('Support value comparision', () {
        expect(event, event);
      });
    });

    group('AppLogoutRequested', () {
      final event = AppLogoutRequested();

      test('Support value comparision', () {
        expect(event, event);
      });
    });
  });
}
