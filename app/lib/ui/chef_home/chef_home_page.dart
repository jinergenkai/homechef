import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../app.dart';
import 'bloc/chef_home.dart';

@RoutePage()
class ChefHomePage extends StatefulWidget {
  const ChefHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChefHomePageState();
  }
}

class _ChefHomePageState extends BasePageState<ChefHomePage, ChefHomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefHomePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefHomeBloc, ChefHomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                bloc.add(const ChefHomePageInitiated());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(Dimens.d20.responsive()),
                  child: Column(
                    children: [
                      //*Header Hello
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Container(
                            // color: Colors.red,
                            child: Theme.of(context).appColor.primaryColor.value == AppColors.chefAppColor.primaryColor.value
                                ? Assets.images.chefLauncherIcon.image(height: Dimens.d60.responsive(), width: Dimens.d60.responsive())
                                : Assets.images.customerLauncherIcon.image(height: Dimens.d60.responsive(), width: Dimens.d60.responsive())),
                        Container(
                          // color: Colors.blue,
                          padding: EdgeInsets.only(left: Dimens.d10.responsive()),
                          child: Text(
                            "Chào mừng\n${state.user.fullName}",
                            style: AppTextStyles.s20w600(color: AppColors.current.primaryColor),
                          ),
                        ),
                        Expanded(
                          child: Container(padding: EdgeInsets.all(Dimens.d10.responsive()), alignment: Alignment.centerRight, child: Icon(Icons.notifications, color: AppColors.current.primaryColor)),
                        )
                      ]),
                      SizedBox(height: Dimens.d40.responsive()),
                      //*Promotion
                      Align(alignment: Alignment.centerLeft, child: Text("HÀNH TRÌNH DÀI CÙNG TÔI", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                        ),
                        items: ["Discount", 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d5.responsive()),
                                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                                  // decoration: BoxDecoration(color: AppColors.current.primaryColor),
                                  child: Assets.images.chefPromotion.image(height: Dimens.d130.responsive(), width: Dimens.d150.responsive())
                                  // Text(
                                  //   '$i',
                                  //   textAlign: TextAlign.center,
                                  //   style: AppTextStyles.s16w700(color: AppColors.current.whiteColor),
                                  // )
                                  );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: Dimens.d20.responsive()),
                      //*New Cooking order
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ĐƠN NẤU MỚI", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.current.blackColor,
                          )
                        ],
                      ),
                      SizedBox(height: Dimens.d20.responsive()),
                      //*Chef List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.cookingOrders.length,
                        itemBuilder: (context, index) => GenericOrderItem(
                          cookingOrder: state.cookingOrders[index],
                          onPressed: () {
                            navigator.push(AppRouteInfo.detailWaitingOrder(state.cookingOrders[index]));
                          },
                          index: index,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
