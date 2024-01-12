import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'create_address_event.freezed.dart';

abstract class CreateAddressEvent extends BaseBlocEvent {
  const CreateAddressEvent();
}

@freezed
class CreateAddressPageInitiated extends CreateAddressEvent with _$CreateAddressPageInitiated {
  const factory CreateAddressPageInitiated() = _CreateAddressPageInitiated;
}
