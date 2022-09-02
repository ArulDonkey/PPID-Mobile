// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpIndividuEvent extends AuthEvent {
  dynamic ktp;
  String nik;
  String email;
  String name;
  String phoneNumber;
  String address;
  String password;
  String confirmPassword;

  SignUpIndividuEvent(
    this.ktp,
    this.nik,
    this.email,
    this.name,
    this.phoneNumber,
    this.address,
    this.password,
    this.confirmPassword,
  );
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent(this.email, this.password);
}
