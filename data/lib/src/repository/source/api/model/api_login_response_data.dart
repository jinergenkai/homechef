import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_current_user_data.dart';

part 'api_login_response_data.freezed.dart';
part 'api_login_response_data.g.dart';

@freezed
class ApiLoginResponseData with _$ApiLoginResponseData {

	const ApiLoginResponseData._();

	factory ApiLoginResponseData({
		@JsonKey(name: 'isFirstTime') bool? isFirstTime,
		@JsonKey(name: 'token') String? token,
		// @JsonKey(name: 'currentUser') ApiCurrentUserData? currentUser,
		@JsonKey(name: 'user') ApiCurrentUserData? currentUser,
	}) = _ApiLoginResponseData;

	factory ApiLoginResponseData.fromJson(Map<String, dynamic> json) => _$ApiLoginResponseDataFromJson(json);
}
