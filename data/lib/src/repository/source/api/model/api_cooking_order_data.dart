import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_chef_data.dart';
import 'api_customer_data.dart';
import 'api_dish_data.dart';
import 'api_transaction_data.dart';

part 'api_cooking_order_data.freezed.dart';
part 'api_cooking_order_data.g.dart';

@freezed
class ApiCookingOrderData with _$ApiCookingOrderData {

	const ApiCookingOrderData._();

	factory ApiCookingOrderData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'chef') ApiChefData? chef,
		@JsonKey(name: 'customer') ApiCustomerData? customer,
		@JsonKey(name: 'status') String? status,
		@JsonKey(name: 'transaction') List<ApiTransactionData>? transaction,
		@JsonKey(name: 'totalPrice') int? totalPrice,
		@JsonKey(name: 'price') int? price,
		@JsonKey(name: 'quantity') int? quantity,
		@JsonKey(name: 'option') int? option,
		@JsonKey(name: 'dish') List<ApiDishData>? dish,
		@JsonKey(name: 'dishType') String? dishType,
		@JsonKey(name: 'note') String? note,
		@JsonKey(name: 'intialTransactionMethod') String? intialTransactionMethod,
		@JsonKey(name: 'rejectReason') String? rejectReason,
	}) = _ApiCookingOrderData;

	factory ApiCookingOrderData.fromJson(Map<String, dynamic> json) => _$ApiCookingOrderDataFromJson(json);
}
