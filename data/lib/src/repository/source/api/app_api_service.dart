import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../data.dart';

@LazySingleton()
class AppApiService {
  AppApiService(
    this._noneAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._randomUserApiClient,
    this._mockApiIoClient,
  );
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;
  final RandomUserApiClient _randomUserApiClient;
  final MockApiIoClient _mockApiIoClient;

  Future<DataResponse<ApiAuthResponseData>?> login({
    required String email,
    required String password,
  }) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/login',
      body: {
        'email': email,
        'password': password,
      },
      decoder: (json) => ApiAuthResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  // Future<DataResponse<ApiCurrentUserData>?> loginV2({
  Future<LoginResponse> loginV2({
    required String accessToken,
    required String fcmToken,
    required int role,
  }) async {
    final result = await Dio().post(
      'https://homechef.kidtalkie.tech/api/v1/auth/login',
      data: {
        'idToken': accessToken,
        'fcmToken': fcmToken,
        'role': role,
      },
    );
    final apiData = ApiLoginResponseData.fromJson(result.data as Map<String, dynamic>);
    print('apiData: $apiData');
    print('accessToken: $accessToken');
    return ApiLoginResponseDataMapper(ApiCurrentUserDataMapper(ApiFeedbackDataMapper())).mapToEntity(apiData);
  }

  //* UpdateProfile
  Future<void> updateProfile({
    required CurrentUser user,
    required String accessToken,
  }) async {
    await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).put(
      'https://homechef.kidtalkie.tech/api/v1/user/${user.id}', 
      data: {
        "email": user.email,
        "fullName": user.fullName,
        "avatarUrl": user.avatarUrl,
        "phone": user.phone,
        "identityCard": user.identityCard,
        "biography": user.biography,
        "birthday": user.birthday,
      },
    );
  }

  Future<List<CurrentUser>?> getChefs() async {
    final response = await Dio().get(
      'https://homechef.kidtalkie.tech/api/v1/user/chef',
    );
    final dataList = response.data as List<dynamic>;
    final converter = <ApiCurrentUserData>[];

    for (var data in dataList) {
      converter.add(ApiCurrentUserData.fromJson(data as Map<String, dynamic>));
    }
    return ApiCurrentUserDataMapper(ApiFeedbackDataMapper()).mapToListEntity(converter);
  }

  Future<void> logout() async {
    await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/logout',
    );
  }

  Future<DataResponse<ApiAuthResponseData>?> register({
    required String username,
    required String email,
    required String password,
    required int gender,
  }) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/register',
      body: {
        'username': username,
        'gender': gender,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
      decoder: (json) => ApiAuthResponseData.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> forgotPassword(String email) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/forgot-password',
      body: {
        'email': email,
      },
    );
  }

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
  }) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/reset-password',
      body: {
        'token': token,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );
  }

  Future<ApiUserData?> getMe() async {
    return _authAppServerApiClient.request(
      method: RestMethod.get,
      path: '/v1/me',
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
      decoder: (json) => ApiUserData.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ResultsListResponse<ApiUserData>?> getUsers({
    required int page,
    required int? limit,
  }) {
    return _randomUserApiClient.request(
      method: RestMethod.get,
      path: '',
      queryParameters: {
        'page': page,
        'results': limit,
      },
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: (json) => ApiUserData.fromJson(json as Map<String, dynamic>),
    );
  }
}
