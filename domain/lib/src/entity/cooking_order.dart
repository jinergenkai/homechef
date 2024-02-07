import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'cooking_order.freezed.dart';
  
@freezed
class CookingOrder with _$CookingOrder {
    const factory CookingOrder({
        @Default(CookingOrder.defaultId) String id,
@Default(CookingOrder.defaultChef) Chef chef,
@Default(CookingOrder.defaultCustomer) Customer customer,
@Default(CookingOrder.defaultStatus) int status,
@Default(CookingOrder.defaultTransaction) List<Transaction> transaction,
@Default(CookingOrder.defaultTotalPrice) int totalPrice,
@Default(CookingOrder.defaultPrice) int price,
@Default(CookingOrder.defaultQuantity) int quantity,
@Default(CookingOrder.defaultOption) int option,
@Default(CookingOrder.defaultNote) String note,
@Default(CookingOrder.defaultDish) List<Dish> dish,
@Default(CookingOrder.defaultDishType) int dishType,
@Default(CookingOrder.defaultIntialTransactionMethod) String intialTransactionMethod,
@Default(CookingOrder.defaultRejectReason) String rejectReason,
@Default(CookingOrder.defaultCookedTime) String cookedTime,
@Default(CookingOrder.defaultCookedHour) int cookedHour,
@Default(CookingOrder.defaultAddressId) String addressId,
@Default(CookingOrder.defaultAddress) Address address,

    }) = _User;
  
    static const defaultId = '';
static const defaultChef = Chef();
static const defaultCustomer = Customer();
static const defaultStatus = 0;
static const defaultTransaction = <Transaction>[];
static const defaultTotalPrice = 0;
static const defaultPrice = 0;
static const defaultQuantity = 1;
static const defaultOption = 0;
static const defaultNote = '';
static const defaultDish = <Dish>[];
static const defaultDishType = 0;
static const defaultIntialTransactionMethod = '';
static const defaultRejectReason = '';
static const defaultCookedTime = '';
static const defaultCookedHour = 0;
static const defaultAddressId = '';
static const defaultAddress = Address();

}  
