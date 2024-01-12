import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.onboarding() = _Onboarding;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.itemDetail(User user) = _UserDetail;
  const factory AppRouteInfo.chooseAddress() = _ChooseAddress;
  const factory AppRouteInfo.createAddress() = _CreateAddress;
}
