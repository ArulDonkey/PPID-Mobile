import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';
import 'package:ppid_mobile/modules/news/news_api_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiRepository _newsApiRepository = NewsApiRepository();

  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvent>(newsEventHandler);
  }

  newsEventHandler(NewsEvent event, Emitter<NewsState> emit) async {
    if (event is GetBeritaPpidEvent) {
      await getBeritaPpidEventHandler(event, emit);
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
    }
  }
}
