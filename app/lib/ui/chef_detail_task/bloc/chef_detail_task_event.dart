import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_detail_task_event.freezed.dart';

abstract class ChefDetailTaskEvent extends BaseBlocEvent {
  const ChefDetailTaskEvent();
}

@freezed
class ChefDetailTaskPageInitiated extends ChefDetailTaskEvent with _$ChefDetailTaskPageInitiated {
  const factory ChefDetailTaskPageInitiated() = _ChefDetailTaskPageInitiated;
}
