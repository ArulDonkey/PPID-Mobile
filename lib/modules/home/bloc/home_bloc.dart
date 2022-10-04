// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ppid_mobile/modules/home/api/home_api_repository.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/title.dart';
import 'package:ppid_mobile/modules/home/models/home_berita.dart';
import 'package:ppid_mobile/utils/network_checker.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository _homeApiRepository = HomeApiRepository();
  final NetworkChecker _networkChecker = NetworkChecker.instance;
  final PpidSharedPreferences _preferences = PpidSharedPreferences();
  final HomeBerita _homeBerita = HomeBerita();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(homeEventHandler);
  }

  homeEventHandler(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetBeritaUinEvent) {
      if (_networkChecker.isOnline) {
        await getBeritaUinEventHandler(event, emit);
      } else {
        emit(BeritaUinNoConnectionState());
      }
    } else if (event is GetBeritaPpidEvent) {
      if (_networkChecker.isOnline) {
        await getBeritaPpidEventHandler(event, emit);
      } else {
        emit(BeritaPpidNoConnectionState());
      }
    } else if (event is SetToInitEvent) {
      emit(HomeInitialState());
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

      List beritaUins = response.data;
      List<BeritaUin> itemList = [];

      for (int i = 0; i < beritaUins.length; i++) {
        var item = beritaUins[i];

        itemList.add(BeritaUin(
          id: item["id"],
          date: item["date"],
          title: Title(rendered: item["title"]["rendered"]),
          slug: item["slug"],
          jetpackFeaturedMediaUrl: item["jetpack_featured_media_url"],
        ));
      }

      if (beritaUins.isEmpty) {
        emit(BeritaUinEmptyState());
      } else {
        _homeBerita.setUin(itemList);
        emit(BeritaUinLoadedState(itemList));
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

      var beritaPpids = response.data["data"]["data"];
      var list = List.generate(beritaPpids.length, (index) {
        return BeritaPpid.fromJson(beritaPpids[index]);
      });
      // _preferences.saveBeritaPpids(list);

      if (beritaPpids.isEmpty) {
        emit(BeritaPpidEmptyState());
      } else {
        _homeBerita.setPpid(list);
        emit(BeritaPpidLoadedState(list));
      }
    } catch (e) {
      emit(BeritaPpidErrorState(e.toString()));
    }
  }
}
