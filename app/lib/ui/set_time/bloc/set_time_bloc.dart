import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

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
    on<ChangedTime>(
      _onChangedTime,
      transformer: log(),
    );
    on<ChangedDate>(
      _onChangedDate,
      transformer: log(),
    );

    on<OptionChanged>(
      _onOptionChanged,
      transformer: log(),
    );
  }

  void _onOptionChanged(
    OptionChanged event,
    Emitter<SetTimeState> emit,
  ) {
    emit(state.copyWith(
      cookingOrder: state.cookingOrder.copyWith(
          option: setOptionMenu(
        state.cookingOrder.option,
        event.option,
        event.isSelected,
      )),
    ));
  }

  FutureOr<void> _onChangedTime(
    ChangedTime event,
    Emitter<SetTimeState> emit,
  ) async {
    var timeSeted = (state.time ?? DateTime.now()).copyWith(
      hour: event.time.hour,
      minute: event.time.minute,
    );

    emit(state.copyWith(
      time: timeSeted,
      cookingOrder: state.cookingOrder.copyWith(
        cookedTime: timeSeted.toStringWithFormat("yyyy-MM-dd HH:mm"),
      )
    ));
  }

  FutureOr<void> _onChangedDate(
    ChangedDate event,
    Emitter<SetTimeState> emit,
  ) async {
    var timeSeted = (state.time??DateTime.now()).copyWith(
      year: event.date.year,
      month: event.date.month,
      day: event.date.day,
    );

    emit(state.copyWith(
      time: timeSeted,
      cookingOrder: state.cookingOrder.copyWith(
        cookedTime: timeSeted.toStringWithFormat("yyyy-MM-dd HH:mm"),
      )
    ));
  }

  FutureOr<void> _onSetTimePageInitiated(
    SetTimePageInitiated event,
    Emitter<SetTimeState> emit,
  ) async {
    emit(state.copyWith(
      cookingOrder: event.order.copyWith(
        cookedTime: DateTime.now().toStringWithFormat("yyyy-MM-dd HH:mm"),
      ),
      time: DateTime.now(),
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
    )));
  }
}
