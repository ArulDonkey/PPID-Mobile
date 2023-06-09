// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaUinLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaUinNoConnectionState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaUinEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaUinLoadedState extends HomeState {
  List<BeritaUin> list;

  BeritaUinLoadedState(this.list);

  @override
  List<Object?> get props => [list];
}

class BeritaUinErrorState extends HomeState {
  String message;

  BeritaUinErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class BeritaPpidLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidNoConnectionState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidLoadedState extends HomeState {
  List<BeritaPpid> list;

  BeritaPpidLoadedState(this.list);

  @override
  List<Object?> get props => [list];
}

class BeritaPpidErrorState extends HomeState {
  String message;

  BeritaPpidErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
