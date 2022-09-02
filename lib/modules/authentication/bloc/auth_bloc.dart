// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ppid_mobile/modules/authentication/api/auth_api_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiRepository _authApiRepository = AuthApiRepository();
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
    }
    // } else {
    //   emit(AuthNoConnectionState());
    // }
  }

  signUpIndividuEventHandler(
      SignUpIndividuEvent event, Emitter<AuthState> emit) async {
    emit(SignUpIndividuLoadingState());
    try {
      // var file = File(path)
      Map<String, dynamic> body = {
        "level": "INDIVIDU",
        "ktp": event.ktp,
        "nmr_ktp": event.nik,
        "username": event.email,
        "nama": event.name,
        "nmr_hp": event.phoneNumber,
        "alamat": event.address,
        "password": event.password,
        "confirm_password": event.confirmPassword,
      };

      http.Response response = await _authApiRepository.signUp(
        body: body,
      );

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      log(responseBody.toString());
    } catch (e) {
      log("$e");
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

      if (response.statusCode == 200) {
        emit(SignInSuccessState());
      } else {
        String message = responseBody["data"]["message"];
        emit(SignInFailedState(message));
      }
    } catch (e) {
      // log(e.toString());
      emit(SignInErrorState(e.toString()));
    }
  }
}
