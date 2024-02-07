import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'set_time.dart';

@Injectable()
class SetTimeBloc extends BaseBloc<SetTimeEvent, SetTimeState> {
  SetTimeBloc() : super(const SetTimeState()) {
    on<SetTimePageInitiated>(
      _onSetTimePageInitiated,
      transformer: log(),
    );
    on<ChangedAddress>(
      _onChangedAddress,
      transformer: log(),
    );
  }

  FutureOr<void> _onSetTimePageInitiated(
    SetTimePageInitiated event,
    Emitter<SetTimeState> emit,
  ) async {
    emit(state.copyWith(
      cookingOrder: event.order,
    ));
  }

  FutureOr<void> _onChangedAddress(
    ChangedAddress event,
    Emitter<SetTimeState> emit,
  ) async {
    final result = await navigator.push(const AppRouteInfo.chooseAddress());
    emit(state.copyWith(
      cookingOrder: state.cookingOrder.copyWith(
        address: result as Address,
      )
    ));
  }
}
