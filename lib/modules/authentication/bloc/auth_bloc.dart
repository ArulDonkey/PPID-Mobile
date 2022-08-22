import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppid_mobile/modules/authentication/api/auth_api_repository.dart';
import 'package:ppid_mobile/utils/network_checker.dart';

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
    if (event is SignUpEvent) {
      await signUpEventHandler(event, emit);
    } else if (event is SignInEvent) {
      await signInEventHandler(event, emit);
    }
    // } else {
    //   emit(AuthNoConnectionState());
    // }
  }

  signUpEventHandler(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
    try {} catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }

  signInEventHandler(SignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInLoadingState());
    try {
      Map<String, dynamic> body = {
        "username": event.email,
        "password": event.password,
      };

      Response response = await _authApiRepository.signIn(
        body: body,
      );

      log(response.statusCode.toString());

      // if (response.statusCode != 401) {
      //   emit(SignInSuccessState());
      // } else {
      //   String message = response.data["data"]["message"];
      //   emit(SignInFailedState(message));
      // }

      log(response.toString());
    } catch (e) {
      log(e.toString());
      emit(SignInErrorState(e.toString()));
    }
  }
}
