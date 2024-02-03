import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'choose_menu_event.freezed.dart';

abstract class ChooseMenuEvent extends BaseBlocEvent {
  const ChooseMenuEvent();
}

@freezed
class ChooseMenuPageInitiated extends ChooseMenuEvent with _$ChooseMenuPageInitiated {
  const factory ChooseMenuPageInitiated() = _ChooseMenuPageInitiated;
}

@freezed
class PeopleChanged extends ChooseMenuEvent with _$PeopleChanged {
  const factory PeopleChanged({
    required int amount,
  }) = _PeopleChanged;
}

@freezed
class AddCourse extends ChooseMenuEvent with _$AddCourse {
  const factory AddCourse() = _AddCourse;
}

@freezed
class ChooseMenuDishChanged extends ChooseMenuEvent with _$ChooseMenuDishChanged {
  const factory ChooseMenuDishChanged({
    required Dish dish,
    required int index,
  }) = _ChooseMenuDishChanged;
}

@freezed
class NoteChanged extends ChooseMenuEvent with _$NoteChanged {
  const factory NoteChanged({
    required String note,
  }) = _NoteChanged;
}

@freezed
class FlavorChanged extends ChooseMenuEvent with _$FlavorChanged {
  const factory FlavorChanged({
    required String flavor,
  }) = _FlavorChanged;
}
