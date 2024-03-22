import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_transaction_data.freezed.dart';
part 'api_transaction_data.g.dart';

@freezed
class ApiTransactionData with _$ApiTransactionData {

	const ApiTransactionData._();

	factory ApiTransactionData({
		@JsonKey(name: 'id') String? id,
		@JsonKey(name: 'amount') int? amount,
		@JsonKey(name: 'transactionMethod') int? transactionMethod,
		@JsonKey(name: 'transactionType') int? transactionType,
		@JsonKey(name: 'transactionStatus') int? transactionStatus,
		@JsonKey(name: 'imageUrl') String? imageUrl,
	}) = _ApiTransactionData;

	factory ApiTransactionData.fromJson(Map<String, dynamic> json) => _$ApiTransactionDataFromJson(json);
}
