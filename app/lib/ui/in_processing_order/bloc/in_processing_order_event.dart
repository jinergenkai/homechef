import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'in_processing_order_event.freezed.dart';

abstract class InProcessingOrderEvent extends BaseBlocEvent {
  const InProcessingOrderEvent();
}

@freezed
class InProcessingOrderPageInitiated extends InProcessingOrderEvent with _$InProcessingOrderPageInitiated {
  const factory InProcessingOrderPageInitiated() = _InProcessingOrderPageInitiated;
}
