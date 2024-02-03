import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish.freezed.dart';
  
@freezed
class Dish with _$Dish {
    const factory Dish({
        @Default(Dish.defaultId) String id,
@Default(Dish.defaultName) String name,
@Default(Dish.defaultPrice) int price,
    }) = _User;
  
    static const defaultId = '';
static const defaultName = '';
static const defaultPrice = 0;
}  
