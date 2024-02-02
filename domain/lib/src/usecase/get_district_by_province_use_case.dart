import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_district_by_province_use_case.freezed.dart';

@Injectable()
class GetDistrictByProvinceUseCase extends BaseFutureUseCase<GetDistrictByProvinceInput, GetDistrictByProvinceOutput> {
  const GetDistrictByProvinceUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetDistrictByProvinceOutput> buildUseCase(GetDistrictByProvinceInput input) async {
    final result = await _repository.getDistricts();
    if (result == null) {
      return const GetDistrictByProvinceOutput();
    }
    return GetDistrictByProvinceOutput(districts: result);
  }
}

@freezed
class GetDistrictByProvinceInput extends BaseInput with _$GetDistrictByProvinceInput {
  const factory GetDistrictByProvinceInput() = _GetDistrictByProvinceInput;
}

@freezed
class GetDistrictByProvinceOutput extends BaseOutput with _$GetDistrictByProvinceOutput {
  const GetDistrictByProvinceOutput._();

  const factory GetDistrictByProvinceOutput({
    @Default([]) List<District> districts,
  }) = _GetDistrictByProvinceOutput;
}
