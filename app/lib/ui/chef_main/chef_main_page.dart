import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';


import '../../app.dart';
import 'bloc/chef_main.dart';

@RoutePage()
class ChefMainPage extends StatefulWidget {
  const ChefMainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChefMainPageState();
  }
}

class _ChefMainPageState extends BasePageState<ChefMainPage, ChefMainBloc> {
  final _bottomBarKey = GlobalKey();

  @override
  Widget buildPage(BuildContext context) {
    return AutoTabsScaffold(
      routes: (navigator as AppNavigatorImpl).tabRoutesChef,
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
