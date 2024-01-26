import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_schedule_event.freezed.dart';

abstract class ChefScheduleEvent extends BaseBlocEvent {
  const ChefScheduleEvent();
}

@freezed
class ChefSchedulePageInitiated extends ChefScheduleEvent with _$ChefSchedulePageInitiated {
  const factory ChefSchedulePageInitiated() = _ChefSchedulePageInitiated;
}
