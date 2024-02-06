import 'dart:async';

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
  }

  FutureOr<void> _onSetTimePageInitiated(
    SetTimePageInitiated event,
    Emitter<SetTimeState> emit,
  ) async {
    emit(state.copyWith(
      cookingOrder: event.order,
    ));
    print(event.order);
  }
}
