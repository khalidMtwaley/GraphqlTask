import 'package:task/features/Auth/data/models/login_response/login.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSucces extends AuthState {
  final Login login;
  LoginSucces(this.login);
}

class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}
