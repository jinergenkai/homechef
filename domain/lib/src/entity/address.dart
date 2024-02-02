import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
  
@freezed
class Address with _$Address {
    const factory Address({
        @Default(Address.defaultHouseNumber) String houseNumber,
@Default(Address.defaultHouseType) String houseType,
@Default(Address.defaultStreet) String street,
@Default(Address.defaultWard) String ward,
@Default(Address.defaultDistrictId) String districtId,
    }) = _User;
  
    static const defaultHouseNumber = '';
static const defaultHouseType = '';
static const defaultStreet = '';
static const defaultWard = '';
static const defaultDistrictId = '';
}  
