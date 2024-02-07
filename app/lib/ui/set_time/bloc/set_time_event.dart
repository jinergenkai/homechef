import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'set_time_event.freezed.dart';

abstract class SetTimeEvent extends BaseBlocEvent {
  const SetTimeEvent();
}

@freezed
class SetTimePageInitiated extends SetTimeEvent with _$SetTimePageInitiated {
  const factory SetTimePageInitiated({
    required CookingOrder order,
  }) = _SetTimePageInitiated;
}

@freezed
class ChangedAddress extends SetTimeEvent with _$ChangedAddress {
  const factory ChangedAddress() = _ChangedAddress;
}

@freezed
class ChangedDate extends SetTimeEvent with _$ChangedDate {
  const factory ChangedDate({
    required DateTime date,
  }) = _ChangedDate;
}

@freezed
class ChangedTime extends SetTimeEvent with _$ChangedTime {
  const factory ChangedTime({
    required TimeOfDay time,
  }) = _ChangedTime;
}