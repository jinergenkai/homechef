import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiLoginResponseDataMapper extends BaseDataMapper<ApiLoginResponseData, LoginResponse> {

  ApiLoginResponseDataMapper(this._apiCurrentUserDataMapper);

  ApiCurrentUserDataMapper _apiCurrentUserDataMapper;

  @override
  LoginResponse mapToEntity(ApiLoginResponseData? data) {
    return LoginResponse(
      isFirstTime: data?.isFirstTime ?? LoginResponse.defaultIsFirstTime,
      token: data?.token ?? LoginResponse.defaultToken,
      currentUser: _apiCurrentUserDataMapper.mapToEntity(data?.currentUser),
    );
  }
}
