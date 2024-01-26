import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_schedule_state.freezed.dart';

@freezed
class ChefScheduleState extends BaseBlocState with _$ChefScheduleState {
  const ChefScheduleState._();

  const factory ChefScheduleState({
    @Default('') String id,
  }) = _ChefScheduleState;
}
