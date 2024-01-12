import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'choose_address_event.freezed.dart';

abstract class ChooseAddressEvent extends BaseBlocEvent {
  const ChooseAddressEvent();
}

@freezed
class ChooseAddressPageInitiated extends ChooseAddressEvent with _$ChooseAddressPageInitiated {
  const factory ChooseAddressPageInitiated() = _ChooseAddressPageInitiated;
}
