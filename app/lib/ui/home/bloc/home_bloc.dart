import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../../../app.dart';
import 'home.dart';

@Injectable()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getCurrentUserUseCase,
  ) : super(const HomeState()) {
    on<HomePageInitiated>(
      _onHomePageInitiated,
      transformer: log(),
    );
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FutureOr<void> _onHomePageInitiated(
    HomePageInitiated event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _getCurrentUserUseCase.execute(GetCurrentUserInput(id: 1));
    print(user.user.displayName);
    emit(state.copyWith(displayName: user.user.displayName));
  }
}
