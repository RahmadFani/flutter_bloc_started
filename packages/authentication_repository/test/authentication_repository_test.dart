import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUser extends Mock implements User {}

void main() {
  group('AuthenticationRepository', () {
    group('Login', () {
      test('should return user not empty', () {
        final repository = AuthenticationRepository();
        repository.login();
        expect(repository.currentUser.isNotEmpty, isTrue);
      });

      test('success when login', () {
        final repository = AuthenticationRepository();
        expect(repository.login(), completes);
      });
    });

    group('Logout', () {
      final repository = AuthenticationRepository();

      test('should return user empty', () {
        repository.logOut();
        expect(repository.currentUser.isEmpty, isTrue);
      });

      test('success when logout', () {
        expect(repository.logOut(), completes);
      });
    });
  });
}
