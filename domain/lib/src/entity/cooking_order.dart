import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'cooking_order.freezed.dart';
  
@freezed
class CookingOrder with _$CookingOrder {
    const factory CookingOrder({
        @Default(CookingOrder.defaultId) String id,
@Default(CookingOrder.defaultChef) Chef chef,
@Default(CookingOrder.defaultCustomer) Customer customer,
@Default(CookingOrder.defaultStatus) String status,
@Default(CookingOrder.defaultTransaction) List<Transaction> transaction,
@Default(CookingOrder.defaultTotalPrice) int totalPrice,
@Default(CookingOrder.defaultPrice) int price,
@Default(CookingOrder.defaultQuantity) int quantity,
@Default(CookingOrder.defaultOption) int option,
@Default(CookingOrder.defaultDish) List<Dish> dish,
@Default(CookingOrder.defaultDishType) String dishType,
@Default(CookingOrder.defaultNote) String note,
@Default(CookingOrder.defaultIntialTransactionMethod) String intialTransactionMethod,
@Default(CookingOrder.defaultRejectReason) String rejectReason,
    }) = _User;
  
    static const defaultId = '';
static const defaultChef = Chef();
static const defaultCustomer = Customer();
static const defaultStatus = '';
static const defaultTransaction = <Transaction>[];
static const defaultTotalPrice = 0;
static const defaultPrice = 0;
static const defaultQuantity = 0;
static const defaultOption = 0;
static const defaultDish = <Dish>[];
static const defaultDishType = '';
static const defaultNote = '';
static const defaultIntialTransactionMethod = '';
static const defaultRejectReason = '';
}  
