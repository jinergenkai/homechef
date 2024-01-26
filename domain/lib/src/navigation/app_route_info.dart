import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo with _$AppRouteInfo {

  //* customer
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.signUp() = _SignUp;
  const factory AppRouteInfo.onboarding() = _Onboarding;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.itemDetail(User user) = _UserDetail;
  const factory AppRouteInfo.chooseAddress() = _ChooseAddress;
  const factory AppRouteInfo.createAddress() = _CreateAddress;
  const factory AppRouteInfo.chooseMenu() = _chooseMenu;
  const factory AppRouteInfo.setTime() = _setTime;
  const factory AppRouteInfo.confirmAndPay() = _confirmAndPay;


  //* chef 
  const factory AppRouteInfo.chefMain() = _chefMain;

}
