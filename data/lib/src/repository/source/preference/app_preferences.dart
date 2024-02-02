import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data.dart';

@LazySingleton()
class AppPreferences with LogMixin {
  AppPreferences(this._sharedPreference) : _encryptedSharedPreferences = EncryptedSharedPreferences(prefs: _sharedPreference);

  final SharedPreferences _sharedPreference;
  final EncryptedSharedPreferences _encryptedSharedPreferences;

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPreferenceKeys.isDarkMode) ?? false;
  }

  String get deviceToken {
    return _sharedPreference.getString(SharedPreferenceKeys.deviceToken) ?? '';
  }

  String get languageCode => _sharedPreference.getString(SharedPreferenceKeys.languageCode) ?? '';

  bool get isFirstLogin => _sharedPreference.getBool(SharedPreferenceKeys.isFirstLogin) ?? true;

  bool get isFirstLaunchApp => _sharedPreference.getBool(SharedPreferenceKeys.isFirstLaunchApp) ?? true;

  Future<String> get accessToken {
    return _encryptedSharedPreferences.getString(SharedPreferenceKeys.accessToken);
  }

  Future<String> get refreshToken {
    return _encryptedSharedPreferences.getString(SharedPreferenceKeys.refreshToken);
  }

  bool get isLoggedIn {
    final token = _sharedPreference.getString(SharedPreferenceKeys.accessToken) ?? '';

    return token.isNotEmpty;
  }

  CurrentUser? get currentUser {
    final user = _sharedPreference.getString(SharedPreferenceKeys.currentUser);
    if (user == null) {
      return null;
    }
    final Map<String, dynamic> json = jsonDecode(jsonDecode(user));
    return CurrentUser(
      id: json["id"],
      email: json['email'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
      phone: json['phone'],
      // identityCard: json['identityCard'] as List<String>,
      biography: json['biography'],
      wallet: json['wallet'],
      birthday: json['birthday'],
      role: json['role'],
    );
  }

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(SharedPreferenceKeys.languageCode, languageCode);
  }

  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _sharedPreference.setBool(SharedPreferenceKeys.isFirstLogin, isFirstLogin);
  }

  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp) {
    return _sharedPreference.setBool(SharedPreferenceKeys.isFirstLaunchApp, isFirstLaunchApp);
  }

  Future<void> saveAccessToken(String token) async {
    await _encryptedSharedPreferences.setString(
      SharedPreferenceKeys.accessToken,
      token,
    );
  }

  Future<void> saveRefreshToken(String token) async {
    await _encryptedSharedPreferences.setString(
      SharedPreferenceKeys.refreshToken,
      token,
    );
  }

  // Future<bool> saveCurrentUser(PreferenceUserData preferenceUserData) {
  //   return _sharedPreference.setString(
  //     SharedPreferenceKeys.currentUser,
  //     json.encode(preferenceUserData),
  //   );
  // }

  Future<bool> saveCurrentUser(CurrentUser preferenceUserData) {
    print(preferenceUserData.fullName);
    // create json userdata
    final Map<String, dynamic> data = {
      "id": preferenceUserData.id,
      "email": preferenceUserData.email,
      "fullName": preferenceUserData.fullName,
      "avatarUrl": preferenceUserData.avatarUrl,
      "phone": preferenceUserData.phone,
      "identityCard": preferenceUserData.identityCard,
      "biography": preferenceUserData.biography,
      "wallet": preferenceUserData.wallet,
      "birthday": preferenceUserData.birthday,
      "role": preferenceUserData.role,
    };
    print(jsonEncode(data));

    return _sharedPreference.setString(
      SharedPreferenceKeys.currentUser,
      // json.encode(preferenceUserData),
      jsonEncode(json.encode(data)),
    );
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference.setBool(SharedPreferenceKeys.isDarkMode, isDarkMode);
  }

  Future<bool> saveDeviceToken(String token) {
    return _sharedPreference.setString(SharedPreferenceKeys.deviceToken, token);
  }

  Future<void> clearCurrentUserData() async {
    await Future.wait(
      [
        _sharedPreference.remove(SharedPreferenceKeys.currentUser),
        _sharedPreference.remove(SharedPreferenceKeys.accessToken),
        _sharedPreference.remove(SharedPreferenceKeys.refreshToken),
      ],
    );
  }
}
