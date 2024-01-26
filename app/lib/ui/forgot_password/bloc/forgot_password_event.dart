import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'forgot_password_event.freezed.dart';

abstract class ForgotPasswordEvent extends BaseBlocEvent {
  const ForgotPasswordEvent();
}

@freezed
class ForgotPasswordPageInitiated extends ForgotPasswordEvent with _$ForgotPasswordPageInitiated {
  const factory ForgotPasswordPageInitiated() = _ForgotPasswordPageInitiated;
}
