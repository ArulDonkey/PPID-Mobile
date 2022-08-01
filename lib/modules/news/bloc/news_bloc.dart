// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/title.dart';
import 'package:ppid_mobile/modules/news/news_api_repository.dart';
import 'package:ppid_mobile/utils/network_checker.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiRepository _newsApiRepository = NewsApiRepository();
  final NetworkChecker _networkChecker = NetworkChecker.instance;

  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvent>(newsEventHandler);
  }

  newsEventHandler(NewsEvent event, Emitter<NewsState> emit) async {
    if (event is GetBeritaPpidEvent) {
      if (_networkChecker.isOnline) {
        await getBeritaPpidEventHandler(event, emit);
      } else {
        emit(BeritaPpidNoConnectionState());
      }
    } else if (event is GetBeritaUinEvent) {
      if (_networkChecker.isOnline) {
        await getBeritaUinEventHandler(event, emit);
      } else {
        emit(BeritaUinNoConnectionState());
      }
    }
  }

  getBeritaPpidEventHandler(
    GetBeritaPpidEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(BeritaPpidLoadingState());
    try {
      Response response = await _newsApiRepository.getBeritaPPID();

      var beritaPpids = response.data["data"]["posts"];

      if (beritaPpids.isEmpty) {
        emit(BeritaPpidEmptyState());
      } else {
        emit(BeritaPpidLoadedState(
          List.generate(beritaPpids.length, (index) {
            return BeritaPpid.fromJson(beritaPpids[index]);
          }),
        ));
      }
    } catch (e) {
      emit(BeritaPpidErrorState(e.toString()));
      // emit(BeritaPpidNoConnectionState());
    }
  }

  getBeritaUinEventHandler(
    GetBeritaUinEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(BeritaUinLoadingState());
    try {
      Response response = await _newsApiRepository.getBeritaUIN();

      List beritaUins = response.data;
      List<BeritaUin> itemList = [];

      for (var item in beritaUins) {
        itemList.add(BeritaUin(
          id: item["id"],
          date: item["date"],
          slug: item["slug"],
          title: Title(rendered: item["title"]["rendered"]),
          jetpackFeaturedMediaUrl: item["jetpack_featured_media_url"],
        ));
      }

      if (beritaUins.isEmpty) {
        emit(BeritaUinEmptyState());
      } else {
        emit(
          BeritaUinLoadedState(itemList),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(BeritaUinErrorState(e.toString()));
      // emit(BeritaUinNoConnectionState());
    }
  }
}
