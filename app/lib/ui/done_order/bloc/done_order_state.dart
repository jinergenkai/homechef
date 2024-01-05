import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'done_order_state.freezed.dart';

@freezed
class DoneOrderState extends BaseBlocState with _$DoneOrderState {
  const DoneOrderState._();

  const factory DoneOrderState({
    @Default('') String id,
  }) = _DoneOrderState;
}
