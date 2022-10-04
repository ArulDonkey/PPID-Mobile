// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppid_mobile/modules/information/api/public_information_api_repository.dart';
import 'package:ppid_mobile/modules/information/models/public_information/public_information.dart';
import 'package:ppid_mobile/utils/network_checker.dart';

part 'public_information_event.dart';
part 'public_information_state.dart';

class PublicInformationBloc
    extends Bloc<PublicInformationEvent, PublicInformationState> {
  final PublicInformationApiRepository _publicInformationApiRepository =
      PublicInformationApiRepository();
  final NetworkChecker _networkChecker = NetworkChecker.instance;

  PublicInformationBloc() : super(PublicInformationInitialState()) {
    on<PublicInformationEvent>(publicInformationEventHandler);
  }

  FutureOr<void> publicInformationEventHandler(
    PublicInformationEvent event,
    Emitter<PublicInformationState> emit,
  ) async {
    if (_networkChecker.isOnline) {
      if (event is GetPublicInformationEvent) {
        await getPublicInformationEventHandler(event, emit);
      }
    } else {
      emit(PublicInformationNoConnectionState());
    }
  }

  getPublicInformationEventHandler(
    GetPublicInformationEvent event,
    Emitter<PublicInformationState> emit,
  ) async {
    emit(PublicInformationLoadingState());
    try {
      Map<String, dynamic> params = {
        "ids_tipe_info_pub": event.type,
      };

      Response response =
          await _publicInformationApiRepository.getPublicInformation(
        params: params,
      );

      var informations = response.data["data"]["data"];

      List<PublicInformation> list = [];

      for (var information in informations) {
        list.add(PublicInformation(
          idInfoPub: information["id_info_pub"],
          idsTipeInfoPub: information["ids_tipe_info_pub"],
          namaInfoPub: information["nama_info_pub"],
          linkInfoPub: information["link_info_pub"],
          subInfoPub: information["sub_info_pub"],
        ));
      }

      if (informations.isEmpty) {
        emit(PublicInformationEmptyState());
      } else {
        emit(PublicInformationLoadedState(list));
      }
    } catch (e) {
      emit(PublicInformationErrorState(e.toString()));
    }
  }
}
