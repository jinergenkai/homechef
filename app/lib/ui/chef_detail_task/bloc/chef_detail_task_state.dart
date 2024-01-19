import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_detail_task_state.freezed.dart';

@freezed
class ChefDetailTaskState extends BaseBlocState with _$ChefDetailTaskState {
  const ChefDetailTaskState._();

  const factory ChefDetailTaskState({
    @Default('') String id,
  }) = _ChefDetailTaskState;
}
