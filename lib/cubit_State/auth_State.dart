abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessToRegisteState extends AuthState {}

class AuthFaildToRegisteState extends AuthState {
  final String message;

  AuthFaildToRegisteState({required this.message});
}

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState({required this.message});
}
