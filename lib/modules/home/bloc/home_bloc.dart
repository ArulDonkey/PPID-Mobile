// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ppid_mobile/modules/home/api/api_repository.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository _homeApiRepository = HomeApiRepository();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(homeEventHandler);
  }

  homeEventHandler(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetBeritaUinEvent) {
      await getBeritaUinEventHandler(event, emit);
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
      // log(beritaUins.toString());

      if (beritaUins.isEmpty) {
        emit(BeritaUinEmptyState());
      } else {
        emit(
          BeritaUinLoadedState(
            List.generate(beritaUins.length, (index) {
              return BeritaUin.fromJson(beritaUins[index]);
            }),
          ),
        );
      }
    } catch (e) {
      emit(BeritaUinErrorState(e.toString()));
    }
  }
}
