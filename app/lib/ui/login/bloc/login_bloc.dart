import 'dart:async';

import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app.dart';
import 'login.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase, this._fakeLoginUseCase) : super(const LoginState()) {
    on<EmailTextFieldChanged>(
      _onEmailTextFieldChanged,
      transformer: distinct(),
    );

    on<PasswordTextFieldChanged>(
      _onPasswordTextFieldChanged,
      transformer: distinct(),
    );

    on<LoginButtonPressed>(
      _onLoginButtonPressed,
      transformer: log(),
    );

    on<EyeIconPressed>(
      _onEyeIconPressed,
      transformer: log(),
    );

    on<FakeLoginButtonPressed>(
      _onFakeLoginButtonPressed,
      transformer: log(),
    );
  }

  final LoginUseCase _loginUseCase;
  final FakeLoginUseCase _fakeLoginUseCase;
  final auth = FirebaseAuth.instance;
  late AppPreferences _appPreferences;

  bool _isLoginButtonEnabled(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  void _onEmailTextFieldChanged(EmailTextFieldChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
      isLoginButtonEnabled: _isLoginButtonEnabled(event.email, state.password),
      onPageError: '',
    ));
  }

  void _onPasswordTextFieldChanged(PasswordTextFieldChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
      isLoginButtonEnabled: _isLoginButtonEnabled(state.email, event.password),
      onPageError: '',
    ));
  }

  FutureOr<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    //login by firebase
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // _appPreferences = AppPreferences(prefs);

      // _appPreferences.saveCurrentUser();

      await auth.signInWithEmailAndPassword(email: state.email, password: state.password);
      if (auth.currentUser == null) {
        throw const ValidationException(ValidationExceptionKind.invalidEmail);
      }
      await navigator.replace(const AppRouteInfo.main());
    } catch (e) {
        await navigator.showDialog(
          AppPopupInfo.confirmDialog(
              message: "Email hoặc Mật khẩu không đúng!",
              onPressed: Func0(() async {
                await navigator.pop();
                // navigator.push(const AppRouteInfo.main());
              })),
        );
    }

    // return runBlocCatching(
    //   action: () async {
    //     //login by firebase
    //     try {
    //       final output = await auth.signInWithEmailAndPassword(email: state.email, password: state.password);
    //       if (output.user == null) {
    //         throw const ValidationException(ValidationExceptionKind.invalidEmail);
    //       }
    //       await navigator.replace(const AppRouteInfo.main());
    //     } catch (e) {
    //       print(e);
    //     }

    //     // await _loginUseCase.execute(LoginInput(email: state.email, password: state.password));
    //     await navigator.replace(const AppRouteInfo.main());
    //   },
    //   handleError: false,
    //   doOnError: (e) async {
    //     emit(state.copyWith(onPageError: exceptionMessageMapper.map(e)));
    //   },
    // );
  }

  FutureOr<void> _onFakeLoginButtonPressed(
    FakeLoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _fakeLoginUseCase.execute(const FakeLoginInput());
      },
    );
  }

  void _onEyeIconPressed(EyeIconPressed event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }
}
