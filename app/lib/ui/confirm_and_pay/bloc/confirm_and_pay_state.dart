import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'confirm_and_pay_state.freezed.dart';

@freezed
class ConfirmAndPayState extends BaseBlocState with _$ConfirmAndPayState {
  const ConfirmAndPayState._();

  const factory ConfirmAndPayState({
    @Default('') String id,
    @Default(false) bool booked,
  }) = _ConfirmAndPayState;
}
