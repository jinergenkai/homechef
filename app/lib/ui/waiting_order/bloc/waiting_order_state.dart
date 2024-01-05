import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'waiting_order_state.freezed.dart';

@freezed
class WaitingOrderState extends BaseBlocState with _$WaitingOrderState {
  const WaitingOrderState._();

  const factory WaitingOrderState({
    @Default('') String id,
  }) = _WaitingOrderState;
}
