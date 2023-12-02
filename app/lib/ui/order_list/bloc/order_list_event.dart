import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'order_list_event.freezed.dart';

abstract class OrderListEvent extends BaseBlocEvent {
  const OrderListEvent();
}

@freezed
class OrderListPageInitiated extends OrderListEvent with _$OrderListPageInitiated {
  const factory OrderListPageInitiated() = _OrderListPageInitiated;
}
