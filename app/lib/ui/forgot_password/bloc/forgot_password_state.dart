import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState extends BaseBlocState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState({
    @Default('') String id,
  }) = _ForgotPasswordState;
}
