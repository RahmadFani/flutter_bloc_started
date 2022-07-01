import 'package:flutter_test/flutter_test.dart';
import 'package:my_wallet/app/app.dart';

void main() {
  group('AppPages', () {
    group('Initial Route', () {
      test('Has correct route', () {
        AppPages.pages.forEach((key, value) {
          expect(key, isNotNull);
          expect(key, isNotEmpty);
          expect(value, isNotNull);
        });
      });
    });
  });
}
