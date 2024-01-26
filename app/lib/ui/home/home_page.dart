import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                padding: EdgeInsets.all(Dimens.d20.responsive()),
                child: Column(
                  children: [
                    //*Header Hello
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                          // color: Colors.red,
                          child: Assets.images.customerLauncherIcon.image(height: Dimens.d60.responsive(), width: Dimens.d60.responsive())),
                      Container(
                        // color: Colors.blue,
                        padding: EdgeInsets.only(left: Dimens.d10.responsive()),
                        child: Text(
                          "Chào mừng\n${"Nguyễn Hùng"}",
                          style: AppTextStyles.s20w600(color: AppColors.current.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Container(padding: EdgeInsets.all(Dimens.d10.responsive()), alignment: Alignment.centerRight, child: Icon(Icons.notifications, color: AppColors.current.primaryColor)),
                      )
                    ]),
                    SizedBox(height: Dimens.d20.responsive()),
                    //*Promotion
                    Align(alignment: Alignment.centerLeft, child: Text("Ưu đãi đặc biệt", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))),
                    CarouselSlider(
                      options: CarouselOptions(height: 130.0),
                      items: ["Discount", 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: Dimens.d5.responsive()),
                                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                                // decoration: BoxDecoration(color: AppColors.current.primaryColor),
                                child: Assets.images.promotionPng.image(height: Dimens.d130.responsive(), width: Dimens.d130.responsive())
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
                    const SizedBox(height: Dimens.d20),
                    //*Create new cooking order
                    GestureDetector(
                      // onTap: () => navigator.push(const AppRouteInfo.chooseAddress()),
                      onTap: () => navigator.push(const AppRouteInfo.chooseMenu()),
                      child: Container(
                          height: Dimens.d75.responsive(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.d10.responsive()),
                            gradient: LinearGradient(colors: [Color(0xFF68B3F4), Color(0xFFBAD8F2)]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Tạo bữa ăn mới", style: AppTextStyles.s20w600(color: AppColors.current.whiteColor)),
                              Assets.images.workPng.image(height: Dimens.d75.responsive(), width: Dimens.d75.responsive())
                            ],
                          )),
                    ),
                    SizedBox(height: Dimens.d10.responsive()),
                    //*Order Cooking directly
                    GestureDetector(
                      onTap: () async => signUpMethod(),
                      child: Container(
                          height: Dimens.d75.responsive(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.d10.responsive()),
                            gradient: LinearGradient(colors: [Color(0xFFEB6147), Color(0xFFFFB690)]),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Text("Order Cooking\ndirectly", style: AppTextStyles.s16w600White()),
                              Text("Đặt đầu bếp \ntrực tiếp", style: AppTextStyles.s20w600(color: AppColors.current.whiteColor)),
                              Assets.images.highfivePng.image(height: Dimens.d75.responsive(), width: Dimens.d75.responsive())
                            ],
                          )),
                    ),
                    SizedBox(height: Dimens.d30.responsive()),
                    //*Recently famous chef
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Đầu bếp nổi tiếng", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
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
                      // itemBuilder: (context, index) => const CardChefProfile(),
                      itemBuilder: (context, index) => const MessageItem(),
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

  Future<void> signUpMethod() async {
    //sign up with firebase.
    var email = "user@gmail.com";
    var password = "123456";
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    //get current user
    var user = FirebaseAuth.instance.currentUser;
    print("user firebase: " + user.toString());
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
