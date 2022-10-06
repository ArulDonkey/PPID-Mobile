// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ppid_mobile/modules/authentication/api/auth_api_repository.dart';
import 'package:ppid_mobile/modules/authentication/models/user/user.dart';
import 'package:ppid_mobile/utils/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiRepository _authApiRepository = AuthApiRepository();
  final PpidSharedPreferences _sharedPreferences = PpidSharedPreferences();
  // final NetworkChecker _networkChecker = NetworkChecker();

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>(authEventHandler);
  }

  authEventHandler(AuthEvent event, Emitter<AuthState> emit) async {
    // if (_networkChecker.isOnline) {
    if (event is SignUpIndividuEvent) {
      await signUpIndividuEventHandler(event, emit);
    } else if (event is SignInEvent) {
      await signInEventHandler(event, emit);
    } else if (event is SignUpLembagaEvent) {
      await signUpLembagaEventHandler(event, emit);
    }
    // } else {
    //   emit(AuthNoConnectionState());
    // }
  }

  signUpIndividuEventHandler(
      SignUpIndividuEvent event, Emitter<AuthState> emit) async {
    emit(SignUpIndividuLoadingState());
    try {
      Map<String, String> body = {
        'level': 'INDIVIDU',
        'nama': event.name,
        'username': event.email,
        'password': event.password,
        'confirm_password': event.confirmPassword,
        'nmr_ktp': event.nik,
        'nmr_hp': event.phoneNumber,
        'nmr_wa': event.phoneNumber,
        'alamat': event.address,
      };

      http.Response response = await _authApiRepository.signUpIndividu(
        body: body,
        file: event.filePath,
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // log(responseBody.toString());

      if (response.statusCode == 200) {
        emit(SignUpIndividuSuccessState());
      } else {
        String message = responseBody['message'];
        emit(SignUpIndividuFailedState(message));
      }
    } catch (e) {
      log('$e');
      emit(SignUpIndividuErrorState(e.toString()));
    }
  }

  signInEventHandler(SignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInLoadingState());
    try {
      Map<String, dynamic> body = {
        "username": event.email,
        "password": event.password,
      };

      http.Response response = await _authApiRepository.signIn(
        body: body,
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      log('$responseBody');

      var user = User.fromJson(responseBody['data']);
      _sharedPreferences.setCurrentUserValue(user);

      if (response.statusCode == 200) {
        emit(SignInSuccessState());
      } else {
        String message = responseBody["message"];
        emit(SignInFailedState(message));
      }
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }

  signUpLembagaEventHandler(
      SignUpLembagaEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignUpLembagaLoadingState());
      Map<String, String> body = {
        'level': 'LEMBAGA',
        'nama': event.name,
        'username': event.email,
        'password': event.password,
        'confirm_password': event.confirmPassword,
        'nmr_ktp': event.nik,
        'nmr_hp': event.phoneNumber,
        'nmr_wa': event.phoneNumber,
        'alamat': event.address
      };

      http.Response response = await _authApiRepository.signUpLembaga(
        body: body,
        fileKtp: event.ktpPath,
        fileSk: event.skPath,
        fileAdArt: event.adartPath,
        fileSkNegara: event.skNegaraPath,
      );

      Map<String, dynamic> responseData = jsonDecode(response.body);
      log('$responseData');

      if (response.statusCode == 200) {
        emit(SignUpLembagaSuccessState());
      } else {
        String message = responseData['message'];
        emit(SignUpLembagaFailedState(message));
      }
    } catch (e) {
      log('$e');
      emit(SignUpLembagaErrorState('$e'));
    }
  }
}
