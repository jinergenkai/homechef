import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../app.dart';
import 'bloc/home.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const HomePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(Dimens.d25.responsive()),
                child: Column(
                  children: [
                    //*Header Hello
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Assets.images.customerLauncherIcon.image(height: Dimens.d50.responsive(), width: Dimens.d45.responsive()),
                      Text(
                        "Welcome back\n${"Nguyen Hung"}",
                        style: AppTextStyles.s20w600(color: AppColors.current.primaryColor),
                      ),
                      Icon(Icons.notifications, color: AppColors.current.primaryColor)
                    ]),
                    SizedBox(height: Dimens.d20.responsive()),
                    //*Promotion
                    Align(alignment: Alignment.centerLeft, child: Text("Special Promotions", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))),
                    CarouselSlider(
                      options: CarouselOptions(height: 130.0),
                      items: ["Discount", 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                                decoration: BoxDecoration(color: AppColors.current.primaryColor),
                                child: Text(
                                  
                                  '$i',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.s16w700(color: AppColors.current.whiteColor),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    //*Create new cooking order
                    Container(
                        height: Dimens.d75.responsive(),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.d10.responsive()),
                          gradient: AppColors.current.primaryGradient,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Create new\ncooking order"),
                            Icon(
                              Icons.add_circle_outline,
                              color: AppColors.current.whiteColor,
                            )
                          ],
                        )),
                    SizedBox(height: Dimens.d20.responsive()),
                    //*Create new cooking order
                    Container(
                        height: Dimens.d75.responsive(),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.d10.responsive()),
                          gradient: AppColors.current.primaryGradient,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Order Cooking\ndirectly"),
                            Icon(
                              Icons.add_circle_outline,
                              color: AppColors.current.whiteColor,
                            )
                          ],
                        )),
                    SizedBox(height: Dimens.d20.responsive()),
                    //*Recently famous chef
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recently famous chef", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
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
                      itemCount: 5,
                      itemBuilder: (context, index) => const CardChefProfile(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardChefProfile extends StatelessWidget {
  const CardChefProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Dimens.d100.responsive(),
      // width: Dimens.d150.responsive(),
        color: Colors.red,
        margin: EdgeInsets.only(bottom: Dimens.d5.responsive()),
      child: Row(
        children: [
          Icon(Icons.account_circle, size: Dimens.d80.responsive()),
          Expanded(
            child: Container(
              height: Dimens.d80.responsive(),
              padding: EdgeInsets.all(Dimens.d10.responsive()),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chef Name Ne",
                    style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                  ),
                  const Text("Chef Address"),
                  const Text(
                    "Description: I am a chef hahahaalkfaaaa",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
