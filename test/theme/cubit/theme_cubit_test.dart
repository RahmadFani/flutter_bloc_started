import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_wallet/theme/cubit/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    test('initial state ThemeCubit Light Theme DEFAULT', () {
      expect(ThemeCubit().state, ThemeData.light());
    });

    group('calls', () {
      blocTest<ThemeCubit, ThemeData>(
        'when Theme Data Change from light to dark',
        build: () => ThemeCubit(),
        act: (cubit) => cubit.changeTheme(),
        expect: () => [ThemeData.dark()],
      );
    });
  });
}
