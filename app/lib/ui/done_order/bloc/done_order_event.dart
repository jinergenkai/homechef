import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'done_order_event.freezed.dart';

abstract class DoneOrderEvent extends BaseBlocEvent {
  const DoneOrderEvent();
}

@freezed
class DoneOrderPageInitiated extends DoneOrderEvent with _$DoneOrderPageInitiated {
  const factory DoneOrderPageInitiated() = _DoneOrderPageInitiated;
}
