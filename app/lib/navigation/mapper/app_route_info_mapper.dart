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
      chooseMenu: (order) => ChooseMenuRoute(order: order),
      setTime: (order) => SetTimeRoute(cookingOrder: order),
      confirmAndPay: (order) => ConfirmAndPayRoute(cookingOrder: order),
      detailWaitingOrder: (order) => DetailWaitingOrderRoute(cookingOrder: order),
      chooseAddress: () => const ChooseAddressRoute(),
      updateInfo: () => const UpdateInfoRoute(),
      uploadProfile: () => const UploadProfileRoute(),
      chefProfile: (chef) => ChefProfileRoute(chef: chef),
      createAddress: () => const CreateAddressRoute(),
      searchOverTime: () => const SearchOverTimeRoute(),
      chefMain: () => const ChefMainRoute(),
      signUp: () => const SignUpRoute(),
      forgotPassword: () => const ForgotPasswordRoute(),
      chefSchedule: () => const ChefScheduleRoute(),
    );
  }
}
