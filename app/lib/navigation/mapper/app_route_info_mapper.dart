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
      setTime: (order) => SetTimeRoute(cookingOrder: order),
      confirmAndPay: (order) => ConfirmAndPayRoute(cookingOrder: order),
      chooseAddress: () => const ChooseAddressRoute(),
      updateInfo: () => const UpdateInfoRoute(),
      uploadProfile: () => const UploadProfileRoute(),
      chefProfile: () => const ChefProfileRoute(),
      createAddress: () => const CreateAddressRoute(),
      searchOverTime: () => const SearchOverTimeRoute(),
      chefMain: () => const ChefMainRoute(),
      signUp: () => const SignUpRoute(),
      forgotPassword: () => const ForgotPasswordRoute(),
      chefSchedule: () => const ChefScheduleRoute(),
    );
  }
}
