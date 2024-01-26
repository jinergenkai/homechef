import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'update_info_event.freezed.dart';

abstract class UpdateInfoEvent extends BaseBlocEvent {
  const UpdateInfoEvent();
}

@freezed
class UpdateInfoPageInitiated extends UpdateInfoEvent with _$UpdateInfoPageInitiated {
  const factory UpdateInfoPageInitiated() = _UpdateInfoPageInitiated;
}
