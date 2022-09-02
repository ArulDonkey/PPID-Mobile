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

class SignUpIndividuFailedState extends AuthState {}

class SignUpIndividuLoadingState extends AuthState {}

class SignUpIndividuErrorState extends AuthState {
  String message;

  SignUpIndividuErrorState(this.message);
}

class SignInSuccessState extends AuthState {}

class SignInFailedState extends AuthState {
  String message;

  SignInFailedState(this.message);
}

class SignInLoadingState extends AuthState {}

class SignInErrorState extends AuthState {
  String message;

  SignInErrorState(this.message);
}
