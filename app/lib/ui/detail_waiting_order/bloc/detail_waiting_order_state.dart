import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'detail_waiting_order_state.freezed.dart';

@freezed
class DetailWaitingOrderState extends BaseBlocState with _$DetailWaitingOrderState {
  const DetailWaitingOrderState._();

  const factory DetailWaitingOrderState({
    @Default('') String id,
    @Default(CookingOrder()) CookingOrder cookingOrder,
  }) = _DetailWaitingOrderState;
}
