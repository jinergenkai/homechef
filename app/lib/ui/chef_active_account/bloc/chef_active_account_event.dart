import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_active_account_event.freezed.dart';

abstract class ChefActiveAccountEvent extends BaseBlocEvent {
  const ChefActiveAccountEvent();
}

@freezed
class ChefActiveAccountPageInitiated extends ChefActiveAccountEvent with _$ChefActiveAccountPageInitiated {
  const factory ChefActiveAccountPageInitiated() = _ChefActiveAccountPageInitiated;
}
