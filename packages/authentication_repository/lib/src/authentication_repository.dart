import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/src/models/model.dart';
import 'package:cache/cache.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:meta/meta.dart';

class AuthenticationRepository {
  AuthenticationRepository({CacheClient? cache})
      : _cache = cache ?? CacheClient();

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  final CacheClient _cache;

  final StreamController<User> _controller = StreamController<User>();

  Stream<User> get user async* {
    yield currentUser;
    yield* _controller.stream;
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  void login() {
    const user = User(id: '123', name: "fani", email: "rahmadfani@gmail.com");
    _cache.write(key: userCacheKey, value: user);
    _controller.add(user);
  }

  Future logOut() async {
    _cache.write(key: userCacheKey, value: User.empty);
    _controller.add(User.empty);
  }
}
