import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    const name = 'name';
    const email = 'email';

    test('is Equal user', () {
      const user1 = User(id: 'id', name: name, email: email);
      const user2 = User(id: 'id', name: name, email: email);
      expect(user1, equals(user2));
    });

    test('is Not Equal user', () {
      const user1 = User(id: 'id', name: name, email: email);
      const user2 = User(id: 'id', name: name, email: 'email2');
      expect(user1, isNot(equals(user2)));
    });

    test('is Empty user', () {
      const user = User.empty;
      expect(user.isEmpty, isTrue);
    });

    test('isEmpty returns false for non-empty user', () {
      const user = User(email: email, id: 'id', name: name);
      expect(user.isEmpty, isFalse);
    });

    test('isNotEmpty returns false for empty user', () {
      expect(User.empty.isNotEmpty, isFalse);
    });

    test('isNotEmpty returns true for non-empty user', () {
      const user = User(id: '', name: name, email: email);
      expect(user.isNotEmpty, isTrue);
    });
  });
}
