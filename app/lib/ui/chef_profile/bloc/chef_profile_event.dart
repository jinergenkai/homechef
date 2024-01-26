import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_profile_event.freezed.dart';

abstract class ChefProfileEvent extends BaseBlocEvent {
  const ChefProfileEvent();
}

@freezed
class ChefProfilePageInitiated extends ChefProfileEvent with _$ChefProfilePageInitiated {
  const factory ChefProfilePageInitiated() = _ChefProfilePageInitiated;
}
