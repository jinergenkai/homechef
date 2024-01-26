import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'sign_up_event.freezed.dart';

abstract class SignUpEvent extends BaseBlocEvent {
  const SignUpEvent();
}

@freezed
class SignUpPageInitiated extends SignUpEvent with _$SignUpPageInitiated {
  const factory SignUpPageInitiated() = _SignUpPageInitiated;
}

@freezed
class EmailTextFieldChanged extends SignUpEvent with _$EmailTextFieldChanged {
  const factory EmailTextFieldChanged({
    required String email,
  }) = _EmailTextFieldChanged;
}

@freezed
class PasswordTextFieldChanged extends SignUpEvent with _$PasswordTextFieldChanged {
  const factory PasswordTextFieldChanged({
    required String password,
  }) = _PasswordTextFieldChanged;
}

@freezed
class EyeIconPressed extends SignUpEvent with _$EyeIconPressed {
  const factory EyeIconPressed() = _EyeIconPressed;
}

@freezed
class SignUpButtonPressed extends SignUpEvent with _$SignUpButtonPressed {
  const factory SignUpButtonPressed() = _SignUpButtonPressed;
}
