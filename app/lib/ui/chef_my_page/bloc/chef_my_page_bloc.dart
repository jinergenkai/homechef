import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_my_page.dart';

@Injectable()
class ChefMyPageBloc extends BaseBloc<ChefMyPageEvent, ChefMyPageState> {
  ChefMyPageBloc(
    this._logoutUseCase,
    this._getCurrentUserUseCase,
  ) : super(const ChefMyPageState()) {
    on<ChefMyPagePageInitiated>(
      _onChefMyPagePageInitiated,
      transformer: log(),
    );
    on<LogoutButtonPressed>(
      _onLogoutButtonPressed,
      transformer: log(),
    );
  }

  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<ChefMyPageState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _logoutUseCase.execute(const LogoutInput());
      },
    );
  }


  FutureOr<void> _onChefMyPagePageInitiated(
    ChefMyPagePageInitiated event,
    Emitter<ChefMyPageState> emit,
  ) async {
    final currentUser = await _getCurrentUserUseCase.execute(const GetCurrentUserInput(id: 1));
    emit(state.copyWith(currentUser: currentUser.user));
  }
}
