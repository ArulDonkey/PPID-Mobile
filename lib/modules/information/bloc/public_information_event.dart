// ignore_for_file: must_be_immutable

part of 'public_information_bloc.dart';

abstract class PublicInformationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPublicInformationEvent extends PublicInformationEvent {
  String type;

  GetPublicInformationEvent(this.type);

  @override
  List<Object> get props => [type];
}
