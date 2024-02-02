import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../data.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,
    this._appPreferences,
    this._appDatabase,
    this._preferenceUserDataMapper,
    this._userDataMapper,
    this._languageCodeDataMapper,
    this._genderDataMapper,
    this._localUserDataMapper,
  );

  final AppApiService _appApiService;
  final AppPreferences _appPreferences;
  final AppDatabase _appDatabase;
  final PreferenceUserDataMapper _preferenceUserDataMapper;
  final ApiUserDataMapper _userDataMapper;
  final LanguageCodeDataMapper _languageCodeDataMapper;
  final GenderDataMapper _genderDataMapper;
  final LocalUserDataMapper _localUserDataMapper;

  // init firebase auth
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;

  @override
  Stream<bool> get onConnectivityChanged => Connectivity().onConnectivityChanged.map((event) => event != ConnectivityResult.none);

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  LanguageCode get languageCode => _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    if (_firebaseAuth.currentUser == null) {
      throw Exception('User not found');
    }

    //set Nguyen Hung is displayname of firebase user
    // await _firebaseAuth.currentUser?.updateDisplayName('Nguyen Hung');

    var loginResponse = await _appApiService.loginV2(
      accessToken: await _firebaseAuth.currentUser?.getIdToken() ?? '',
      fcmToken: '',
      role: _appPreferences.isDarkMode ? 2 : 1,
    );

    //check true role of user
    if (loginResponse.currentUser.role == "CUSTOMER" && _appPreferences.isDarkMode != false) {
      throw Exception('User not found');
    }
    if (loginResponse.currentUser.role == "CHEF" && _appPreferences.isDarkMode != true) {
      throw Exception('User not found');
    }

    // print(loginResponse);
    // loginResponse = loginResponse.copyWith(currentUser: loginResponse.currentUser.copyWith(fullName: 'Nguyen Hung1'));
    // loginResponse.currentUser.fullName = 'Nguyen Hung1';

    await Future.wait([
      saveAccessToken(await loginResponse.token),
      saveUserPreference(
        // User(
        //   displayName: _firebaseAuth.currentUser?.displayName ?? '',
        //   email: _firebaseAuth.currentUser?.email ?? '',
        //   phoneNumber: _firebaseAuth.currentUser?.phoneNumber ?? '',
        //   photoUrl: _firebaseAuth.currentUser?.photoURL ?? '',
        // ),
        loginResponse.currentUser,
      ),
    ]);

    // final response = await _appApiService.login(email: email, password: password);
    // await Future.wait([
    //   saveAccessToken(response?.data?.accessToken ?? ''),
    //   saveUserPreference(
    //     User(
    //       id: response?.data?.id ?? -1,
    //       email: response?.data?.email ?? '',
    //     ),
    //   ),
    // ]);
  }

  @override
  Future<void> logout() async {
    // await _appApiService.logout();
    await _firebaseAuth.signOut();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) =>
      _appApiService.resetPassword(
        token: token,
        email: email,
        password: password,
      );

  @override
  Future<void> forgotPassword(String email) => _appApiService.forgotPassword(email);

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
    required String displayName,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user?.updateDisplayName(displayName);

    var loginResponse = await _appApiService.loginV2(
      accessToken: await _firebaseAuth.currentUser?.getIdToken() ?? '',
      fcmToken: '',
      role: _appPreferences.isDarkMode ? 2 : 1,
    );
    await _appApiService.updateProfile(
      accessToken: loginResponse.token,
      user: loginResponse.currentUser.copyWith(fullName: displayName),
    );

    

    // final response = await _appApiService.register(
    //   username: username,
    //   email: email,
    //   password: password,
    //   gender: _genderDataMapper.mapToData(gender),
    // );
    // await Future.wait([
    //   saveAccessToken(response?.data?.accessToken ?? ''),
    //   saveUserPreference(
    //     User(
    //       id: response?.data?.id ?? -1,
    //       email: response?.data?.email ?? '',
    //     ),
    //   ),
    // ]);
  }

  @override
  // User getUserPreference() => _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);
  CurrentUser getUserPreference() {
    var result = _appPreferences.currentUser ?? const CurrentUser();
    // result = result.copyWith(
    //   fullName: _firebaseAuth.currentUser?.displayName ?? '',
    //   avatarUrl: _firebaseAuth.currentUser?.photoURL ?? '',
    // );
    return result;
  }

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();

  @override
  Future<PagedList<User>> getUsers({
    required int page,
    required int? limit,
  }) async {
    final response = await _appApiService.getUsers(page: page, limit: limit);

    return PagedList(data: _userDataMapper.mapToListEntity(response?.results));
  }

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences.saveLanguageCode(_languageCodeDataMapper.mapToData(languageCode));
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<User> getMe() async {
    final response = await _appApiService.getMe();

    return _userDataMapper.mapToEntity(response);
  }

  @override
  int deleteAllUsersAndImageUrls() {
    return _appDatabase.deleteAllUsersAndImageUrls();
  }

  @override
  bool deleteImageUrl(int id) {
    return _appDatabase.deleteImageUrl(id);
  }

  @override
  User? getLocalUser(int id) {
    return _localUserDataMapper.mapToEntity(_appDatabase.getUser(id));
  }

  @override
  List<User> getLocalUsers() {
    return _localUserDataMapper.mapToListEntity(_appDatabase.getUsers());
  }

  @override
  Stream<List<User>> getLocalUsersStream() {
    return _appDatabase.getUsersStream().map((event) => _localUserDataMapper.mapToListEntity(event));
  }

  @override
  int putLocalUser(User user) {
    final userData = _localUserDataMapper.mapToData(user);

    return _appDatabase.putUser(userData);
  }

  @override
  Future<void> saveAccessToken(String accessToken) => _appPreferences.saveAccessToken(accessToken);

  @override
  // Future<bool> saveUserPreference(User user) => _appPreferences.saveCurrentUser(_preferenceUserDataMapper.mapToData(user));
  Future<bool> saveUserPreference(CurrentUser user) => _appPreferences.saveCurrentUser(user);

  @override
  Future<List<CurrentUser>?> getChefs() async {
    return _appApiService.getChefs();
  }
}
