import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_order_list_state.freezed.dart';

@freezed
class ChefOrderListState extends BaseBlocState with _$ChefOrderListState {
  const ChefOrderListState._();

  const factory ChefOrderListState({
    @Default('') String id,
  }) = _ChefOrderListState;
}
