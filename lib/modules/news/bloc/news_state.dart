// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaUinLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaUinNoConnectionState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaUinEmptyState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaUinLoadedState extends NewsState {
  List<BeritaUin> list;

  BeritaUinLoadedState(this.list);

  @override
  List<Object?> get props => [list];
}

class BeritaUinErrorState extends NewsState {
  String message;

  BeritaUinErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class BeritaPpidLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidNoConnectionState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidEmptyState extends NewsState {
  @override
  List<Object?> get props => [];
}

class BeritaPpidLoadedState extends NewsState {
  List<BeritaPpid> list;

  BeritaPpidLoadedState(this.list);

  @override
  List<Object?> get props => [list];
}

class BeritaPpidErrorState extends NewsState {
  String message;

  BeritaPpidErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
