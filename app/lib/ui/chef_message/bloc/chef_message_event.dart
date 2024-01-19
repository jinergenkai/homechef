import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_message_event.freezed.dart';

abstract class ChefMessageEvent extends BaseBlocEvent {
  const ChefMessageEvent();
}

@freezed
class ChefMessagePageInitiated extends ChefMessageEvent with _$ChefMessagePageInitiated {
  const factory ChefMessagePageInitiated() = _ChefMessagePageInitiated;
}
