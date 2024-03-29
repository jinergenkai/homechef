import 'dart:async';

import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'sign_up.dart';

@Injectable()
class SignUpBloc extends BaseBloc<SignUpEvent, SignUpState> {
  SignUpBloc(
    // this._getInitialAppDataUseCase,
    this._registerAccountUseCase,
  ) : super(const SignUpState()) {
    on<SignUpPageInitiated>(
      _onSignUpPageInitiated,
      transformer: log(),
    );

    on<EmailTextFieldChanged>(
      _onEmailTextFieldChanged,
      transformer: log(),
    );

    on<PasswordTextFieldChanged>(
      _onPasswordTextFieldChanged,
      transformer: log(),
    );

    on<EyeIconPressed>(
      _onEyeIconPressed,
      transformer: log(),
    );

    on<SignUpButtonPressed>(
      _onSignUpButtonPressed,
      transformer: log(),
    );

    on<UsernameTextFieldChanged>(
      _onUsernameTextFieldChanged,
      transformer: log(),
    );
  }

  FutureOr<void> _onEmailTextFieldChanged(
    EmailTextFieldChanged event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  FutureOr<void> _onPasswordTextFieldChanged(
    PasswordTextFieldChanged event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  _onUsernameTextFieldChanged(
    UsernameTextFieldChanged event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      fullName: event.username,
    ));
  }

  FutureOr<void> _onEyeIconPressed(
    EyeIconPressed event,
    Emitter<SignUpState> emit,
  ) async {}

  final auth = FirebaseAuth.instance;
  final RegisterAccountUseCase _registerAccountUseCase;

  FutureOr<void> _onSignUpButtonPressed(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    // //sign in by firebase
    // final result = await auth.createUserWithEmailAndPassword(email: state.email, password: state.password);

    // //get role
    // final role = _getInitialAppDataUseCase.execute(const GetInitialAppDataInput()).isDarkMode;
    // if (result.user != null) {
    //   if (role) {
    //     await navigator.replace(const AppRouteInfo.chefMain());
    //   } else {
    //     await navigator.replace(const AppRouteInfo.main());
    //   }
    // }
    return runBlocCatching(action: () async {
      await _registerAccountUseCase.execute(RegisterAccountInput(email: state.email, password: state.password, username: state.fullName, gender: Gender.defaultValue));
    });
  }


  FutureOr<void> _onSignUpPageInitiated(
    SignUpPageInitiated event,
    Emitter<SignUpState> emit,
  ) async {}
}
