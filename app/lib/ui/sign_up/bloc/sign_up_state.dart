import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState extends BaseBlocState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default('') String email,
    @Default('') String fullName,
    @Default('') String password,
    @Default('') String rePassword,
    @Default(false) bool isSignUpButtonEnabled,
    @Default(false) bool obscureText,
    @Default('') String onPageError,
    @Default(false) bool showSignUpButtonLoading,
  }) = _SignUpState;
}
