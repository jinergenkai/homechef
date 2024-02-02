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

@freezed
class AddressChanged extends CreateAddressEvent with _$AddressChanged {
  const factory AddressChanged({
    required String address,
  }) = _AddressChanged;
}

@freezed
class DistrictChanged extends CreateAddressEvent with _$DistrictChanged {
  const factory DistrictChanged({
    required String selectedDistrictId,
  }) = _DistrictChanged;
}

@freezed
class ContactNameChanged extends CreateAddressEvent with _$ContactNameChanged {
  const factory ContactNameChanged({
    required String contactName,
  }) = _ContactNameChanged;
}

@freezed
class PhoneNumberChanged extends CreateAddressEvent with _$PhoneNumberChanged {
  const factory PhoneNumberChanged({
    required String phoneNumber,
  }) = _PhoneNumberChanged;
}

@freezed
class CreateAddressButtonPressed extends CreateAddressEvent with _$CreateAddressButtonPressed {
  const factory CreateAddressButtonPressed() = _CreateAddressButtonPressed;
}