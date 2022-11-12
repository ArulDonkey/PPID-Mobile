// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

part of 'application_letter_bloc.dart';

abstract class ApplicationLetterState extends Equatable {
  const ApplicationLetterState();

  @override
  List<Object> get props => [];
}

class ApplicationLetterInitialState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class ApplicationLetterLoadingState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class ApplicationLetterLoadedState extends ApplicationLetterState {
  List<ApplicationLetter> list;

  ApplicationLetterLoadedState(this.list);

  @override
  List<Object> get props => [list];
}

class ApplicationLetterEmptyState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class ApplicationLetterNoConnectionState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class ApplicationLetterErrorState extends ApplicationLetterState {
  String message;

  ApplicationLetterErrorState(this.message);

  @override
  List<Object> get props => [];
}

class PostApplicationLetterLoadingState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class PostApplicationLetterSuccessState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class PostApplicationLetterFailedState extends ApplicationLetterState {
  @override
  List<Object> get props => [];
}

class PostApplicationLetterErrorState extends ApplicationLetterState {
  final String message;

  PostApplicationLetterErrorState(this.message);

  @override
  List<Object> get props => [message];
}
