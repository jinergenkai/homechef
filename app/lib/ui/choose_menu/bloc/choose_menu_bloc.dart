import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'choose_menu.dart';

@Injectable()
class ChooseMenuBloc extends BaseBloc<ChooseMenuEvent, ChooseMenuState> {
  ChooseMenuBloc() : super(const ChooseMenuState()) {
    on<ChooseMenuPageInitiated>(
      _onChooseMenuPageInitiated,
      transformer: log(),
    );

    on<PeopleChanged>(
      _onPeopleChanged,
      transformer: log(),
    );

    on<AddCourse>(
      _onAddCourse,
      transformer: log(),
    );
  }

  void _onPeopleChanged(
    PeopleChanged event,
    Emitter<ChooseMenuState> emit,
  ) {
    emit(state.copyWith(
      people: (state.people + event.amount >= 0) ? state.people + event.amount : state.people,
    ));
  }

  void _onAddCourse(
    AddCourse event,
    Emitter<ChooseMenuState> emit,
  ) {
    // state.menu.add("1");
    emit(state.copyWith(
      menu: [...state.menu, ""],
    ));
  }

  FutureOr<void> _onChooseMenuPageInitiated(
    ChooseMenuPageInitiated event,
    Emitter<ChooseMenuState> emit,
  ) async {}
}
