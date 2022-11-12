// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ppid_mobile/modules/application_request/api/application_letter_api_repository.dart';
import 'package:ppid_mobile/modules/application_request/models/application_letter.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

part 'application_letter_event.dart';
part 'application_letter_state.dart';

class ApplicationLetterBloc
    extends Bloc<ApplicationLetterEvent, ApplicationLetterState> {
  final ApplicationLetterApiRepository _apiRepository =
      ApplicationLetterApiRepository();
  final PpidSharedPreferences _preferences = PpidSharedPreferences();
  User? _user;

  ApplicationLetterBloc() : super(ApplicationLetterInitialState()) {
    on<ApplicationLetterEvent>(applicationLetterEventHandler);
  }

  applicationLetterEventHandler(ApplicationLetterEvent event,
      Emitter<ApplicationLetterState> emit) async {
    if (event is GetApplicationLetterEvent) {
      await getApplicationLetterEventHandler(event, emit);
    } else if (event is PostApplicationLetterEvent) {
      await postApplicationLetterEventHandler(event, emit);
    }
  }

  getApplicationLetterEventHandler(GetApplicationLetterEvent event,
      Emitter<ApplicationLetterState> emit) async {
    emit(ApplicationLetterLoadingState());
    _user = await getCurrentUser();
    try {
      var response = await _apiRepository.getInformation(
        token: _user!.token,
      );
      var data = response.data['data']['data'];
      if (data.isEmpty) {
        emit(ApplicationLetterEmptyState());
      } else {
        emit(ApplicationLetterLoadedState(
          List.generate(data.length, (index) {
            return ApplicationLetter.fromJson(data[index]);
          }),
        ));
      }
      // log('$data');
    } catch (e) {
      log('$e');
      emit(ApplicationLetterErrorState('$e'));
    }
  }

  postApplicationLetterEventHandler(
    PostApplicationLetterEvent event,
    Emitter<ApplicationLetterState> emit,
  ) async {
    _user = await getCurrentUser();
    final Map<String, dynamic> body = {
      'tujuan': event.purpose,
      'rincian': event.detail,
      'pernyataan': event.statement
    };
    emit(PostApplicationLetterLoadingState());
    try {
      var response = await _apiRepository.requestInformation(
        body: body,
        token: _user!.token,
      );

      if (response.statusCode == 200) {
        emit(PostApplicationLetterSuccessState());
      } else {
        emit(PostApplicationLetterFailedState());
      }
    } catch (e) {
      log('$e');
      emit(PostApplicationLetterErrorState('$e'));
    }
  }

  Future<User> getCurrentUser() async {
    var user = await _preferences.getCurrentUserValue();
    if (user != null) {
      var map = jsonDecode(user);
      user = User.fromJson(map);
    }

    return user;
  }
}
