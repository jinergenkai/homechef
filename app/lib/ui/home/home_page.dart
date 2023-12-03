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
            return Container(
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
                  Align(alignment: Alignment.centerLeft, child: Text("Special Promotions", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))),
                  //*Promotion
                  CarouselSlider(
                    options: CarouselOptions(height: 130.0),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              ));
                        },
                      );
                    }).toList(),
                  ),
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
                          Text("Create new\ncooking order"),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.current.whiteColor,
                          )
                        ],
                      )),
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
                          Text("Order Cooking\ndirectly"),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.current.whiteColor,
                          )
                        ],
                      )),
                  //*Order Cooking directly
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order Cooking directly", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.current.blackColor,
                      )
                    ],
                  ),
                  //*Chef List
                  Text("Chef List"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
