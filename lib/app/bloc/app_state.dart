part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  initializing,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.initializing() : this._(status: AppStatus.initializing);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
