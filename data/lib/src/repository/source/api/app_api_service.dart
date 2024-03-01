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
    try {
      final result = await Dio().post(
        'https://homechef.kidtalkie.tech/api/v1/auth/login',
        data: {
          'idToken': accessToken,
          'fcmToken': "string",
          'role': role,
        },
      );
      final apiData = ApiLoginResponseData.fromJson(result.data as Map<String, dynamic>);
      // print('apiData: $apiData');
      print(apiData);
      return ApiLoginResponseDataMapper(ApiCurrentUserDataMapper(ApiFeedbackDataMapper())).mapToEntity(apiData);
    } catch (e) {
      // print(e);
      throw e;
    }
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

  //* Get districts
  Future<List<District>?> getDistricts() async {
    final response = await Dio().get(
      'https://homechef.kidtalkie.tech/api/v1/address/districts/7fcf75c0-cb8e-4fc3-9a5a-e70a83a7a066',
    );
    final dataList = response.data as List<dynamic>;
    final converter = <ApiDistrictData>[];

    for (var data in dataList) {
      converter.add(ApiDistrictData.fromJson(data as Map<String, dynamic>));
    }
    return ApiDistrictDataMapper().mapToListEntity(converter);
  }

  //* add address
  Future<void> addAddress({
    required String accessToken,
    required Address address,
  }) async {
    await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).post(
      'https://homechef.kidtalkie.tech/api/v1/address',
      data: {
        "houseNumber": address.houseNumber,
        "houseType": "APARTMENT",
        "street": address.street,
        "ward": address.ward,
        "districtId": address.districtId,
      },
    );
  }

  //* get list<address> by path userId
  Future<List<Address>?> getAddresses({
    required String accessToken,
    required String userId,
  }) async {
    // print(userId + " " + accessToken);
    final response = await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).get(
      'https://homechef.kidtalkie.tech/api/v1/address/customers/$userId',
    );
    final dataList = response.data as List<dynamic>;
    final converter = <ApiAddressData>[];
    for (var data in dataList) {
      converter.add(ApiAddressData.fromJson(data as Map<String, dynamic>));
    }
    return ApiAddressDataMapper().mapToListEntity(converter);
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

  // #region order - dish

  //* get list<dish>
  Future<List<Dish>> getDishes({
    required String accessToken,
  }) async {
    final response = await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).get(
      'https://homechef.kidtalkie.tech/api/v1/order/dish',
    );
    final dataList = response.data as List<dynamic>;
    final converter = <ApiDishData>[];

    for (var data in dataList) {
      converter.add(ApiDishData.fromJson(data as Map<String, dynamic>));
    }
    return ApiDishDataMapper().mapToListEntity(converter);
  }
  // #endregion

  //* order addCookingOrder
  Future<void> addCookingOrder({
    required String accessToken,
    required CookingOrder cookingOrder,
  }) async {
    try {
      // print(cookingOrder.cookedTime);
      print(cookingOrder.dish.map((e) => e.id).toList());
      final response = await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).post(
        'https://homechef.kidtalkie.tech/api/v1/order',
        data: {
          "addressId": cookingOrder.address.id,
          "dishType": cookingOrder.dishType,
          "dishIds": cookingOrder.dish.map((e) => e.id).toList(),
          "note": cookingOrder.note,
          "quantity": cookingOrder.quantity,
          "price": cookingOrder.price,
          "option": cookingOrder.option,
          "transactionMethod": 0,
          "cookedTime": revertModifyTimeFormat(cookingOrder.cookedTime),
          // "cookedTime": "2024-02-23T07:29:41.449Z",
          "cookedHour": cookingOrder.cookedHour,
          "voucherIds": List<String>.empty(),
        },
      ).then((value) => print("addCookingOrder:" + value.data));
    } catch (e) {
      // print("EEEEEEEEEEERRRRRRRRRRRRRRROOOOOOOORRRRRR");
      // print(e);
      throw e;
    }
  }

  Future<void> changeCookingOrder({
    required String accessToken,
    required CookingOrder cookingOrder,
    required int orderStatus,
  }) async {
    try {
      // final response = await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).put(
      //   'https://homechef.kidtalkie.tech/api/v1/order/${cookingOrder.id}',
      //   data: {
      //     "chefId": cookingOrder.chef.id,
      //     "status": orderStatus,
      //     "totalPrice": cookingOrder.totalPrice,
      //     "price": cookingOrder.price,
      //     "quantity": cookingOrder.quantity,
      //     "dish": cookingOrder.dish.map((e) => e.id).toList(),
      //     "dishType": cookingOrder.dishType,
      //     "intialTransactionMethod": 0,
      //   },
      // );
      await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).delete('https://homechef.kidtalkie.tech/api/v1/order/${cookingOrder.id}');

      final response = await Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'})).post(
        'https://homechef.kidtalkie.tech/api/v1/order',
        data: {
          "chefId": cookingOrder.chef.id,
          "addressId": cookingOrder.address.id,
          "dishType": cookingOrder.dishType,
          "dishIds": cookingOrder.dish.map((e) => e.id).toList(),
          "note": cookingOrder.note,
          "quantity": cookingOrder.quantity,
          "price": cookingOrder.price,
          "option": cookingOrder.option,
          "transactionMethod": 0,
          "cookedTime": revertModifyTimeFormat(cookingOrder.cookedTime),
          // "cookedTime": "2024-02-23T07:29:41.449Z",
          "cookedHour": orderStatus,
          "voucherIds": List<String>.empty(),
        },
      ).then((value) => print("addCookingOrder:" + value.data));
    } catch (e) {
      throw e;
    }
  }

  Future<List<CookingOrder>> getCookingOrders() async {
    final response = await Dio().get(
      'https://homechef.kidtalkie.tech/api/v1/order',
    );
    final dataList = response.data as List<dynamic>;
    final converter = <ApiCookingOrderData>[];

    for (var data in dataList) {
      converter.add(ApiCookingOrderData.fromJson(data as Map<String, dynamic>));
    }
    return ApiCookingOrderDataMapper(
      ApiChefDataMapper(ApiFeedbackDataMapper()),
      ApiCustomerDataMapper(ApiFeedbackDataMapper()),
      ApiTransactionDataMapper(),
      ApiDishDataMapper(),
      ApiAddressDataMapper(),
    ).mapToListEntity(converter);
  }

  // #region Auth, current user - old
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
  // #endregion
}

String revertModifyTimeFormat(String originalTime) {
  RegExp regex = RegExp(r'^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2})$');
  RegExpMatch? match = regex.firstMatch(originalTime);
  if (match != null) {
    String datePart = match.group(1) ?? "0000";
    String timePart = match.group(2) ?? "00:00";
    return '${datePart}T${timePart}:00.000Z';
  }
  return originalTime;
}
