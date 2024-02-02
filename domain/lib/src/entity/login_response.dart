import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'login_response.freezed.dart';
  
@freezed
class LoginResponse with _$LoginResponse {
    const factory LoginResponse({
        @Default(LoginResponse.defaultIsFirstTime) bool isFirstTime,
@Default(LoginResponse.defaultToken) String token,
@Default(LoginResponse.defaultCurrentUser) CurrentUser currentUser,
    }) = _User;
  
    static const defaultIsFirstTime = false;
static const defaultToken = '';
static const defaultCurrentUser = CurrentUser();
}  
