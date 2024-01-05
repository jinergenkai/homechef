import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'waiting_order_event.freezed.dart';

abstract class WaitingOrderEvent extends BaseBlocEvent {
  const WaitingOrderEvent();
}

@freezed
class WaitingOrderPageInitiated extends WaitingOrderEvent with _$WaitingOrderPageInitiated {
  const factory WaitingOrderPageInitiated() = _WaitingOrderPageInitiated;
}
