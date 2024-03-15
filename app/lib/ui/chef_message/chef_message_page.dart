import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/chef_message.dart';
  
@RoutePage()
class ChefMessagePage extends StatefulWidget {
  const ChefMessagePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChefMessagePageState();
  }
}

class _ChefMessagePageState extends BasePageState<ChefMessagePage, ChefMessageBloc> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    bloc.add(const ChefMessagePageInitiated());
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: CommonAppBar(
          leadingIcon: LeadingIcon.none,
          backgroundColor: AppColors.current.whiteColor,
          elevation: 4,
          shadowColor: AppColors.current.blackColor.withOpacity(0.2),
          height: Dimens.d70.responsive(),
          titleType: AppBarTitle.text,
          text: "Message",
          titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimens.d20.responsive()),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.current.blackColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  padding: EdgeInsets.all(Dimens.d2.responsive()),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.current.primaryColor,
                  ),
                  labelColor: AppColors.current.whiteColor,
                  unselectedLabelColor: AppColors.current.blackColor.withOpacity(0.3),
                  labelStyle: AppTextStyles.s20w600(color: AppColors.current.whiteColor),

                  tabs: [
                    const Tab(text: 'Message'),
                    const Tab(text: "Notification"),
                  ],
                ),
              ),
              SizedBox(height: Dimens.d10.responsive()),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const SubMessagePage(),
                    const NotificationPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
