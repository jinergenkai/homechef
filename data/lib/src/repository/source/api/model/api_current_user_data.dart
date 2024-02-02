import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_feedback_data.dart';

part 'api_current_user_data.freezed.dart';
part 'api_current_user_data.g.dart';

@freezed
class ApiCurrentUserData with _$ApiCurrentUserData {

	const ApiCurrentUserData._();

	factory ApiCurrentUserData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'email') String? email,
		@JsonKey(name: 'fullName') String? fullName,
		@JsonKey(name: 'avatarUrl') String? avatarUrl,
		@JsonKey(name: 'phone') String? phone,
		@JsonKey(name: 'identityCard') List<String>? identityCard,
		@JsonKey(name: 'biography') String? biography,
		@JsonKey(name: 'wallet') int? wallet,
		@JsonKey(name: 'birthday') String? birthday,
		@JsonKey(name: 'role') String? role,
		// @JsonKey(name: 'rating') int? rating,
		// @JsonKey(name: 'totalFeedbacks') int? totalFeedbacks,
		// @JsonKey(name: 'feedbacks') List<ApiFeedbackData>? feedbacks,
		// @JsonKey(name: 'totalOrders') int? totalOrders,
		// @JsonKey(name: 'createdOn') String? createdOn,
		// @JsonKey(name: 'status') String? status,
	}) = _ApiCurrentUserData;

	factory ApiCurrentUserData.fromJson(Map<String, dynamic> json) => _$ApiCurrentUserDataFromJson(json);
}
