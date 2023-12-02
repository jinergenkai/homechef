import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'order_list_state.freezed.dart';

@freezed
class OrderListState extends BaseBlocState with _$OrderListState {
  const OrderListState._();

  const factory OrderListState({
    @Default('') String id,
  }) = _OrderListState;
}
