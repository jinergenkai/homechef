import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
  
import '../../app.dart';
import '../done_order/done_order_page.dart';
import '../in_processing_order/in_processing_order_page.dart';
import '../waiting_order/waiting_order_page.dart';
import 'bloc/order_list.dart';
  
@RoutePage()
class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _OrderListPageState();
  }
}

class _OrderListPageState extends BasePageState<OrderListPage, OrderListBloc> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    bloc.add(const OrderListPageInitiated());
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
          text: "Bữa ăn của bạn",
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

                  tabs: const [
                    Tab(text: 'Chờ'),
                    Tab(text: 'Đã nhận'),
                    Tab(text: 'Xong'),
                  ],
                ),
              ),
              SizedBox(height: Dimens.d10.responsive()),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    WaitingOrderPage(role: 0, status: 1),
                    WaitingOrderPage(role: 0, status: 2),
                    WaitingOrderPage(role: 0, status: 3),
                    // InProcessingOrderPage(),
                    // DoneOrderPage(),
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
