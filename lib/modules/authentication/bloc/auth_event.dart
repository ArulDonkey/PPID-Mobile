// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpLembagaEvent extends AuthEvent {
  String ktpPath;
  String skPath;
  String adartPath;
  String skNegaraPath;
  String name;
  String email;
  String password;
  String confirmPassword;
  String nik;
  String phoneNumber;
  String address;

  SignUpLembagaEvent({
    required this.ktpPath,
    required this.skPath,
    required this.adartPath,
    required this.skNegaraPath,
    required this.nik,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });
}

class SignUpIndividuEvent extends AuthEvent {
  String filePath;
  String name;
  String email;
  String password;
  String confirmPassword;
  String nik;
  String phoneNumber;
  String address;

  SignUpIndividuEvent({
    required this.filePath,
    required this.nik,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  });
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent(this.email, this.password);
}
