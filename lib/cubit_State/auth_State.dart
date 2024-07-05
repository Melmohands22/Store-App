import '../models/user_model.dart';

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

class LoginSuccessState extends LoginState {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}

class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState({required this.message});
}

abstract class LogoutState {}

class LogoutInitialState extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessState extends LogoutState {}

class LogoutFaildState extends LogoutState {
  final String message;

  LogoutFaildState({required this.message});
}