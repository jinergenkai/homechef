import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';


import '../../app.dart';
import 'bloc/main.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BasePageState<MainPage, MainBloc> {
  final _bottomBarKey = GlobalKey();

  @override
  Widget buildPage(BuildContext context) {
    return AutoTabsScaffold(
      routes: (navigator as AppNavigatorImpl).tabRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        (navigator as AppNavigatorImpl).tabsRouter = tabsRouter;

        return BottomNavigationBar(
          
          key: _bottomBarKey,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (index == tabsRouter.activeIndex) {
              (navigator as AppNavigatorImpl).popUntilRootOfCurrentBottomTab();
            }
            tabsRouter.setActiveIndex(index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: AppColors.current.secondaryColor,
          selectedItemColor: AppColors.current.primaryColor,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: AppColors.current.primaryColor,
          items: bottomIcons,
        );
      },
    );
  }
}

List<BottomNavigationBarItem> bottomIcons = [
  BottomNavigationBarItem(
    label: "Home",
    icon: ImageIcon(Assets.images.homeIcon.image().image),
    activeIcon: ImageIcon(Assets.images.homeIconActive.image().image),
  ),
  BottomNavigationBarItem(
    label: "Home",
    icon: ImageIcon(Assets.images.messageIcon.image().image),
    activeIcon: ImageIcon(Assets.images.messageIconActive.image().image),
  ),
  BottomNavigationBarItem(
    label: "Home",
    icon: ImageIcon(Assets.images.receiptIcon.image().image),
    activeIcon: ImageIcon(Assets.images.receiptIconActive.image().image),
  ),
  BottomNavigationBarItem(
    label: "Home",
    icon: ImageIcon(Assets.images.userIcon.image().image),
    activeIcon: ImageIcon(Assets.images.userIconActive.image().image),
  ),
];

enum BottomTabReplacer {
  home(icon: Icon(Icons.home), activeIcon: Icon(Icons.home)),
  message(icon: Icon(Icons.chat), activeIcon: Icon(Icons.chat)),
  orderList(icon: Icon(Icons.list), activeIcon: Icon(Icons.list)),
  myPage(icon: Icon(Icons.people), activeIcon: Icon(Icons.people)),
  ;

  const BottomTabReplacer({
    required this.icon,
    required this.activeIcon,
  });
  final Widget icon;
  final Widget activeIcon;

  String get title {
    switch (this) {
      case BottomTabReplacer.home:
        return S.current.home;
      case BottomTabReplacer.message:
        return S.current.message;
      case BottomTabReplacer.orderList:
        return S.current.orders;
      case BottomTabReplacer.myPage:
        return S.current.user;
    }
  }
}
