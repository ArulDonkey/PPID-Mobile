// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  Map<String, dynamic> body;

  SignUpEvent(this.body);
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent(this.email, this.password);
}
