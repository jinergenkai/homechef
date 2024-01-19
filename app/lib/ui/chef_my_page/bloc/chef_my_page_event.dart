import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'chef_my_page_event.freezed.dart';

abstract class ChefMyPageEvent extends BaseBlocEvent {
  const ChefMyPageEvent();
}

@freezed
class ChefMyPagePageInitiated extends ChefMyPageEvent with _$ChefMyPagePageInitiated {
  const factory ChefMyPagePageInitiated() = _ChefMyPagePageInitiated;
}
