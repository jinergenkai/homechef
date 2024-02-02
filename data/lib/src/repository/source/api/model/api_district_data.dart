import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_district_data.freezed.dart';
part 'api_district_data.g.dart';

@freezed
class ApiDistrictData with _$ApiDistrictData {

	const ApiDistrictData._();

	factory ApiDistrictData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'name') String? name,
		@JsonKey(name: 'provinceId') String? provinceId,
	}) = _ApiDistrictData;

	factory ApiDistrictData.fromJson(Map<String, dynamic> json) => _$ApiDistrictDataFromJson(json);
}
