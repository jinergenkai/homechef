import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'set_time_event.freezed.dart';

abstract class SetTimeEvent extends BaseBlocEvent {
  const SetTimeEvent();
}

@freezed
class SetTimePageInitiated extends SetTimeEvent with _$SetTimePageInitiated {
  const factory SetTimePageInitiated() = _SetTimePageInitiated;
}
