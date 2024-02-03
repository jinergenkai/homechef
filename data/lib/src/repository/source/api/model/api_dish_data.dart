import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_dish_data.freezed.dart';
part 'api_dish_data.g.dart';

@freezed
class ApiDishData with _$ApiDishData {

	const ApiDishData._();

	factory ApiDishData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'name') String? name,
	}) = _ApiDishData;

	factory ApiDishData.fromJson(Map<String, dynamic> json) => _$ApiDishDataFromJson(json);
}
