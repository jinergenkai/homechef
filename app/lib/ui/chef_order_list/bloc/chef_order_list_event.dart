import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_order_list_event.freezed.dart';

abstract class ChefOrderListEvent extends BaseBlocEvent {
  const ChefOrderListEvent();
}

@freezed
class ChefOrderListPageInitiated extends ChefOrderListEvent with _$ChefOrderListPageInitiated {
  const factory ChefOrderListPageInitiated() = _ChefOrderListPageInitiated;
}
