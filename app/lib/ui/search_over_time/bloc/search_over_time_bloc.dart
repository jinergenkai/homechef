import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'search_over_time.dart';

@Injectable()
class SearchOverTimeBloc extends BaseBloc<SearchOverTimeEvent, SearchOverTimeState> {
  SearchOverTimeBloc(this._getChefsUseCase) : super(const SearchOverTimeState()) {
    on<SearchOverTimePageInitiated>(
      _onSearchOverTimePageInitiated,
      transformer: log(),
    );

    on<PressSearchButton>(
      _onPressSearchButton,
      transformer: log(),
    );
  }

  final GetChefsUseCase _getChefsUseCase;

  FutureOr<void> _onSearchOverTimePageInitiated(
    SearchOverTimePageInitiated event,
    Emitter<SearchOverTimeState> emit,
  ) async {}

  FutureOr<void> _onPressSearchButton(
    PressSearchButton event,
    Emitter<SearchOverTimeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getChefsUseCase.execute(GetChefsInput(id: 1));
    emit(state.copyWith(isLoading: false, chefs: result.chefs));
  }
}
