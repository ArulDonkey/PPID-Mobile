// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthNoConnectionState extends AuthState {}

class AuthErrorState extends AuthState {
  String message;

  AuthErrorState(this.message);
}

class SignUpIndividuSuccessState extends AuthState {}

class SignUpIndividuFailedState extends AuthState {
  String message;

  SignUpIndividuFailedState(this.message);
}

class SignUpIndividuLoadingState extends AuthState {}

class SignUpIndividuErrorState extends AuthState {
  String message;

  SignUpIndividuErrorState(this.message);
}

class SignUpLembagaSuccessState extends AuthState {}

class SignUpLembagaFailedState extends AuthState {
  String message;

  SignUpLembagaFailedState(this.message);
}

class SignUpLembagaLoadingState extends AuthState {}

class SignUpLembagaErrorState extends AuthState {
  String message;

  SignUpLembagaErrorState(this.message);
}

class SignInSuccessState extends AuthState {}

class SignInFailedState extends AuthState {
  String message;

  SignInFailedState(this.message);
}

class SignInLoadingState extends AuthState {}

class SignInNotVerifiedState extends AuthState {
  String message;

  SignInNotVerifiedState(this.message);
}

class SignInErrorState extends AuthState {
  String message;

  SignInErrorState(this.message);
}
