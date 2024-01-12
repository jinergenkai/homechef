import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      onboarding: () => const OnboardingRoute(),
      itemDetail: (user) => ItemDetailRoute(user: user),
      chooseMenu: () => const ChooseMenuRoute(),
      setTime: () => const SetTimeRoute(),
      confirmAndPay: () => const ConfirmAndPayRoute(),
      chooseAddress: () => const ChooseAddressRoute(),
      createAddress: () => const CreateAddressRoute(),
    );
  }
}
