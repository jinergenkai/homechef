import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../app.dart';

// ignore_for_file:prefer-single-widget-per-file
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: ChooseMenuRoute.page),
        AutoRoute(page: ChooseAddressRoute.page),
        AutoRoute(page: CreateAddressRoute.page),
        AutoRoute(page: SetTimeRoute.page),
        AutoRoute(page: ConfirmAndPayRoute.page),
        AutoRoute(page: ChefMainRoute.page, children: [
          AutoRoute(
            // page: true ? ChefActiveAccountRoute.page : ChefHomeRoute.page,
            page: ChefHomeRoute.page,
          ),
          AutoRoute(
            page: ChefMessageRoute.page,
          ),
          AutoRoute(
            page: ChefOrderListRoute.page,
          ),
          AutoRoute(
            page: ChefMyRouteRoute.page,
          ),
        ]),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(
            page: HomeTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: HomeRoute.page, initial: true),
              AutoRoute(
                page: ItemDetailRoute.page,
                guards: [RouteGuard(GetIt.instance.get<IsLoggedInUseCase>())],
              ),
            ],
          ),
          AutoRoute(
            page: MessageTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: MessageRoute.page, initial: true, children: [
                AutoRoute(
                  page: SubMessageTab.page,
                  maintainState: true,
                  children: [
                    AutoRoute(page: SubMessageRoute.page, initial: true),
                  ],
                ),
                AutoRoute(
                  page: NotificationTab.page,
                  maintainState: true,
                  children: [
                    AutoRoute(page: NotificationRoute.page, initial: true),
                  ],
                ),
              ]),
            ],
          ),
          AutoRoute(
            page: OrderListTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: OrderListRoute.page, initial: true),
            ],
          ),
          AutoRoute(
            page: MyPageTab.page,
            maintainState: true,
            children: [
              AutoRoute(page: MyPageRoute.page, initial: true),
            ],
          ),
        ]),
      ];
}

//***
@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'MessageTab')
class MessageTabPage extends AutoRouter {
  const MessageTabPage({super.key});
}

@RoutePage(name: 'MyPageTab')
class MyPageTabPage extends AutoRouter {
  const MyPageTabPage({super.key});
}

@RoutePage(name: 'OrderListTab')
class OrderListTabPage extends AutoRouter {
  const OrderListTabPage({super.key});
}

//***
@RoutePage(name: 'SubMessageTab')
class SubMessageTabPage extends AutoRouter {
  const SubMessageTabPage({super.key});
}

@RoutePage(name: 'NotificationTab')
class NotificationTabPage extends AutoRouter {
  const NotificationTabPage({super.key});
}
