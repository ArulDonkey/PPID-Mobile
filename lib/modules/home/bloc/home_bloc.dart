// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ppid_mobile/modules/home/api/home_api_repository.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository _homeApiRepository = HomeApiRepository();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(homeEventHandler);
  }

  homeEventHandler(HomeEvent event, Emitter<HomeState> emit) async {
    // if (network.onStatusChange.li) {

    // }
    if (event is GetBeritaUinEvent) {
      await getBeritaUinEventHandler(event, emit);
    } else if (event is GetBeritaPpidEvent) {
      await getBeritaPpidEventHandler(event, emit);
    }
  }

  getBeritaUinEventHandler(
    GetBeritaUinEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(BeritaUinLoadingState());
    try {
      Map<String, dynamic> params = {
        "page": 1,
        "per_page": 5,
      };

      Response response = await _homeApiRepository.getBeritaUIN(
        params: params,
      );

      var beritaUins = response.data;

      if (beritaUins.isEmpty) {
        emit(BeritaUinEmptyState());
      } else {
        emit(
          BeritaUinLoadedState(
            List.generate(beritaUins.length, (index) {
              // Map<String, dynamic> map = Map<String, dynamic>.from(
              //   beritaUins[index].map(
              //     (e) => BeritaUin.fromJson(e),
              //   ),
              // );

              // log(map.runtimeType.toString());
              return BeritaUin.fromJson(beritaUins[index]);
            }),
          ),
        );
      }
    } catch (e) {
      emit(BeritaUinErrorState(e.toString()));
    }
  }

  getBeritaPpidEventHandler(
    GetBeritaPpidEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(BeritaPpidLoadingState());
    try {
      Map<String, dynamic> params = {
        "page": 1,
        "limit": 5,
      };

      Response response = await _homeApiRepository.getBeritaPPID(
        params: params,
      );

      var beritaPpids = response.data["data"]["posts"];

      if (beritaPpids.isEmpty) {
        emit(BeritaPpidEmptyState());
      } else {
        emit(
          BeritaPpidLoadedState(
            List.generate(beritaPpids.length, (index) {
              return BeritaPpid.fromJson(
                beritaPpids[index],
              );
            }),
          ),
        );
      }
    } catch (e) {
      emit(BeritaPpidErrorState(e.toString()));
    }
  }
}
