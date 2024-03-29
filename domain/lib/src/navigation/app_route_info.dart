import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo with _$AppRouteInfo {

  //* customer
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.signUp() = _SignUp;
  const factory AppRouteInfo.forgotPassword() = _ForgotPassword;
  const factory AppRouteInfo.onboarding() = _Onboarding;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.itemDetail(User user) = _UserDetail;
  const factory AppRouteInfo.chooseAddress() = _ChooseAddress;
  const factory AppRouteInfo.createAddress() = _CreateAddress;
  const factory AppRouteInfo.chooseMenu(CookingOrder? order) = _chooseMenu;
  const factory AppRouteInfo.setTime(CookingOrder order) = _setTime;
  const factory AppRouteInfo.detailWaitingOrder(CookingOrder order) = _detailWaitingOrder;
  const factory AppRouteInfo.confirmAndPay(CookingOrder order) = _confirmAndPay;

  const factory AppRouteInfo.searchOverTime() = _searchOverTime;
  const factory AppRouteInfo.chefProfile(CurrentUser chef) = _chefProfile;


  //* chef 
  const factory AppRouteInfo.chefMain() = _chefMain;
  const factory AppRouteInfo.updateInfo() = _updateInfo;
  const factory AppRouteInfo.uploadProfile() = _uploadProfile;
  const factory AppRouteInfo.chefSchedule() = _chefSchedule;

}
