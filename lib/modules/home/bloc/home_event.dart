part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class GetBeritaUinEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetBeritaPpidEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
