import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'in_processing_order_state.freezed.dart';

@freezed
class InProcessingOrderState extends BaseBlocState with _$InProcessingOrderState {
  const InProcessingOrderState._();

  const factory InProcessingOrderState({
    @Default('') String id,
  }) = _InProcessingOrderState;
}
