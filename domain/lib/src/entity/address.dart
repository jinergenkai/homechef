import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
  
@freezed
class Address with _$Address {
    const factory Address({
        @Default(Address.defaultId) String id,
@Default(Address.defaultHouseNumber) String houseNumber,
@Default(Address.defaultStreet) String street,
@Default(Address.defaultWard) String ward,
@Default(Address.defaultDescription) String description,
@Default(Address.defaultDistrict) String district,
@Default(Address.defaultDistrictId) String districtId,
    }) = _User;
  
    static const defaultId = '';
static const defaultHouseNumber = '';
static const defaultStreet = '';
static const defaultWard = '';
static const defaultDescription = '';
static const defaultDistrict = '';
static const defaultDistrictId = '';
}  
