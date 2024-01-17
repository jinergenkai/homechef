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
