part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class GetBeritaUinEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class GetBeritaPpidEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
