import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'set_time_state.freezed.dart';

@freezed
class SetTimeState extends BaseBlocState with _$SetTimeState {
  const SetTimeState._();

  const factory SetTimeState({
    @Default('') String id,
    DateTime? time,
    @Default(CookingOrder()) CookingOrder cookingOrder,
  }) = _SetTimeState;
}
