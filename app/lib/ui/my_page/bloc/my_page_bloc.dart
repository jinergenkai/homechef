import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import sharepreferences
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app.dart';
import 'my_page.dart';

@Injectable()
class MyPageBloc extends BaseBloc<MyPageEvent, MyPageState> {
  MyPageBloc(this._logoutUseCase) : super(const MyPageState()) {
    on<LogoutButtonPressed>(
      _onLogoutButtonPressed,
      transformer: log(),
    );
  }

  final LogoutUseCase _logoutUseCase;
  final auth = FirebaseAuth.instance;

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<MyPageState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.clear();

        await auth.signOut();
        // print("123");
        // await _logoutUseCase.execute(const LogoutInput());
        navigator.popUntilRouteName("");
        await navigator.push(const AppRouteInfo.onboarding());
      },
    );
  }
}
