import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_main_event.freezed.dart';

abstract class ChefMainEvent extends BaseBlocEvent {
  const ChefMainEvent();
}

@freezed
class ChefMainPageInitiated extends ChefMainEvent with _$ChefMainPageInitiated {
  const factory ChefMainPageInitiated() = _ChefMainPageInitiated;
}
