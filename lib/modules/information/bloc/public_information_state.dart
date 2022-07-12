// ignore_for_file: must_be_immutable

part of 'public_information_bloc.dart';

abstract class PublicInformationState extends Equatable {
  @override
  List<Object> get props => [];
}

class PublicInformationInitialState extends PublicInformationState {
  @override
  List<Object> get props => [];
}

class PublicInformationLoadingState extends PublicInformationState {
  @override
  List<Object> get props => [];
}

class PublicInformationNoConnectionState extends PublicInformationState {
  @override
  List<Object> get props => [];
}

class PublicInformationEmptyState extends PublicInformationState {
  @override
  List<Object> get props => [];
}

class PublicInformationLoadedState extends PublicInformationState {
  dynamic list;

  PublicInformationLoadedState(this.list);

  @override
  List<Object> get props => [list];
}

class PublicInformationErrorState extends PublicInformationState {
  String message;

  PublicInformationErrorState(this.message);

  @override
  List<Object> get props => [message];
}
