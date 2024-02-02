import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiAddressDataMapper extends BaseDataMapper<ApiAddressData, Address> {
    @override
    Address mapToEntity(ApiAddressData? data) {
      return Address(
        id: data?.id ?? Address.defaultId,
houseNumber: data?.houseNumber ?? Address.defaultHouseNumber,
street: data?.street ?? Address.defaultStreet,
ward: data?.ward ?? Address.defaultWard,
description: data?.description ?? Address.defaultDescription,
district: data?.district ?? Address.defaultDistrict,
districtId: data?.districtId ?? Address.defaultDistrictId,
      );
    }
}  
