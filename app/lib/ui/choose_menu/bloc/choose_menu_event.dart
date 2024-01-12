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
