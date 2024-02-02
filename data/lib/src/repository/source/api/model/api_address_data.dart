import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_address_data.freezed.dart';
part 'api_address_data.g.dart';

@freezed
class ApiAddressData with _$ApiAddressData {

	const ApiAddressData._();

	factory ApiAddressData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'houseNumber') String? houseNumber,
		@JsonKey(name: 'street') String? street,
		@JsonKey(name: 'ward') String? ward,
		@JsonKey(name: 'description') String? description,
		@JsonKey(name: 'district') String? district,
		@JsonKey(name: 'districtId') String? districtId,
	}) = _ApiAddressData;

	factory ApiAddressData.fromJson(Map<String, dynamic> json) => _$ApiAddressDataFromJson(json);
}
