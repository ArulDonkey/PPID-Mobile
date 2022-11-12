// ignore_for_file: prefer_const_constructors_in_immutables

part of 'application_letter_bloc.dart';

abstract class ApplicationLetterEvent extends Equatable {
  const ApplicationLetterEvent();

  @override
  List<Object> get props => [];
}

class GetApplicationLetterEvent extends ApplicationLetterEvent {}

class PostApplicationLetterEvent extends ApplicationLetterEvent {
  final String detail;
  final String purpose;
  final String statement;

  PostApplicationLetterEvent({
    required this.detail,
    required this.purpose,
    required this.statement,
  });
}
