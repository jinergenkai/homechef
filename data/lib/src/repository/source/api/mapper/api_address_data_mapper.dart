import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiAddressDataMapper extends BaseDataMapper<ApiAddressData, Address> {
    @override
    Address mapToEntity(ApiAddressData? data) {
      return Address(
        houseNumber: data?.houseNumber ?? Address.defaultHouseNumber,
houseType: data?.houseType ?? Address.defaultHouseType,
street: data?.street ?? Address.defaultStreet,
ward: data?.ward ?? Address.defaultWard,
districtId: data?.districtId ?? Address.defaultDistrictId,
      );
    }
}  
