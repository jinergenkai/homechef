import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_home_event.freezed.dart';

abstract class ChefHomeEvent extends BaseBlocEvent {
  const ChefHomeEvent();
}

@freezed
class ChefHomePageInitiated extends ChefHomeEvent with _$ChefHomePageInitiated {
  const factory ChefHomePageInitiated() = _ChefHomePageInitiated;
}
