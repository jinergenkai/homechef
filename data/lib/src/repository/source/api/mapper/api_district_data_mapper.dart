import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiDistrictDataMapper extends BaseDataMapper<ApiDistrictData, District> {
    @override
    District mapToEntity(ApiDistrictData? data) {
      return District(
        id: data?.id ?? District.defaultId,
name: data?.name ?? District.defaultName,
provinceId: data?.provinceId ?? District.defaultProvinceId,
      );
    }
}  
