part of 'application_letter_bloc.dart';

abstract class ApplicationLetterEvent extends Equatable {
  const ApplicationLetterEvent();

  @override
  List<Object> get props => [];
}

class GetApplicationLetterEvent extends ApplicationLetterEvent {}
