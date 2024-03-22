import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
  
@freezed
class Transaction with _$Transaction {
    const factory Transaction({
        @Default(Transaction.defaultId) String id,
@Default(Transaction.defaultAmount) int amount,
@Default(Transaction.defaultTransactionMethod) int transactionMethod,
@Default(Transaction.defaultTransactionType) int transactionType,
@Default(Transaction.defaultTransactionStatus) int transactionStatus,
@Default(Transaction.defaultImageUrl) String imageUrl,
    }) = _User;
  
    static const defaultId = '';
static const defaultAmount = 0;
static const defaultTransactionMethod = 0;
static const defaultTransactionType = 0;
static const defaultTransactionStatus = 0;
static const defaultImageUrl = '';
}  
