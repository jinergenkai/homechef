import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
  
@freezed
class District with _$District {
    const factory District({
        @Default(District.defaultId) String id,
@Default(District.defaultName) String name,
@Default(District.defaultProvinceId) String provinceId,
    }) = _User;
  
    static const defaultId = '';
static const defaultName = '';
static const defaultProvinceId = '';
}  
