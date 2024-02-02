import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_feedback_data.freezed.dart';
part 'api_feedback_data.g.dart';

@freezed
class ApiFeedbackData with _$ApiFeedbackData {

	const ApiFeedbackData._();

	factory ApiFeedbackData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'orderId') String? orderId,
		@JsonKey(name: 'content') String? content,
		@JsonKey(name: 'rating') int? rating,
		@JsonKey(name: 'createdAt') String? createdAt,
		@JsonKey(name: 'createdBy') String? createdBy,
	}) = _ApiFeedbackData;

	factory ApiFeedbackData.fromJson(Map<String, dynamic> json) => _$ApiFeedbackDataFromJson(json);
}
