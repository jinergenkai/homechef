import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_home.dart';

@Injectable()
class ChefHomeBloc extends BaseBloc<ChefHomeEvent, ChefHomeState> {
  ChefHomeBloc(
    this._getCurrentUserUseCase,
  ) : super(const ChefHomeState()) {
    on<ChefHomePageInitiated>(
      _onChefHomePageInitiated,
      transformer: log(),
    );
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FutureOr<void> _onChefHomePageInitiated(
    ChefHomePageInitiated event,
    Emitter<ChefHomeState> emit,
  ) async {
    final user = await _getCurrentUserUseCase.execute(GetCurrentUserInput(id: 1));
    // print(user);
    emit(state.copyWith(user: user.user));
  }
}
