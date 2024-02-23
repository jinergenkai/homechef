import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'detail_waiting_order_event.freezed.dart';

abstract class DetailWaitingOrderEvent extends BaseBlocEvent {
  const DetailWaitingOrderEvent();
}

@freezed
class DetailWaitingOrderPageInitiated extends DetailWaitingOrderEvent with _$DetailWaitingOrderPageInitiated {
  const factory DetailWaitingOrderPageInitiated({
    required CookingOrder order,
  }) = _DetailWaitingOrderPageInitiated;
}

@freezed
class AcceptButtonPressed extends DetailWaitingOrderEvent with _$AcceptButtonPressed {
  const factory AcceptButtonPressed() = _AcceptButtonPressed;
}