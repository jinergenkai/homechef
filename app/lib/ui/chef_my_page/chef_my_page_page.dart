import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/chef_my_page.dart';

@RoutePage(name: 'ChefMyPageRoute')
class ChefMyPagePage extends StatefulWidget {
  const ChefMyPagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChefMyPagePageState();
  }
}

class _ChefMyPagePageState extends BasePageState<ChefMyPagePage, ChefMyPageBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefMyPagePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<ChefMyPageBloc, ChefMyPageState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(Dimens.d30.responsive()),
                child: Column(
                  children: [
                    //* image + name + description
                    Row(
                      children: [
                        //* avatar
                        Container(
                            width: Dimens.d100.responsive(),
                            height: Dimens.d100.responsive(),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  // image: Assets.images.avatarChef.image().image,
                                  // image: Image.network("https://i.pravatar.cc/300?img=${20}").image,
                                  image: Image.network("https://img.timviec.com.vn/2021/10/chef-la-gi-4.jpg").image,
                                  fit: BoxFit.cover,
                                ))),
                        Column(
                          children: [
                            //* Name
                            Text(
                              state.currentUser.fullName,
                              style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                            ),
                            SizedBox(height: Dimens.d10.responsive()),
                            //* Description
                            Container(
                              width: Dimens.d200.responsive(),
                              padding: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                              child: Text("Tôi tin rằng quan niệm công việc nội trợ là dành cho phụ nữ nên thay đổi.",
                                  style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor.withOpacity(.75)), maxLines: 2, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    //* wallet
                    Stack(
                      children: [
                        Assets.images.wallet.image(),
                        Positioned(
                          bottom: Dimens.d10.responsive(),
                          right: Dimens.d10.responsive(),
                          child: Text(
                            (state.wallet == 0) ? "Loading ..." : NumberFormatUtils.formatNumber(state.wallet) + " VND",
                            style: AppTextStyles.s20w600(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    GestureDetector(
                        onTap: () async {
                          //show popup to input money and request get money
                          final res = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("HomeChef - Rút Tiền", style: AppTextStyles.s20w600(color: AppColors.current.primaryColor),),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // TextField(
                                      //   decoration: InputDecoration(hintText: "Nhập số tiền"),
                                      // ),
                                      Text("Bạn vui lòng liên hệ Homechef.\n\nphone/zalo: 0383 943 248\nhomechefinvietnam@gmail.com\nfb@HomeChefVietnam"),
                                      SizedBox(height: Dimens.d20.responsive()),
                                      ElevatedButton(
                                        onPressed: () {
                                          //show popup await delivery
                                          navigator.pop(result: true);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
                                        ),
                                        child: Text("Ok"),
                                      )
                                    ],
                                  ),
                                );
                              });
                          // if (res != null && res == true) {
                          //   await showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return AlertDialog(
                          //           title: Text("Yêu cầu rút tiền"),
                          //           content: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             children: [
                          //               Text("Yêu cầu rút tiền của bạn đã được gửi đi. Vui lòng chờ xác nhận từ quản trị viên."),
                          //               SizedBox(height: Dimens.d20.responsive()),
                          //               ElevatedButton(
                          //                 onPressed: () {
                          //                   navigator.pop();
                          //                 },
                          //                 child: Text("OK"),
                          //               )
                          //             ],
                          //           ),
                          //         );
                          //       });
                          // }
                        },
                        child: Container(
                          width: double.infinity,
                          height: Dimens.d60.responsive(),
                          alignment: Alignment.center,
                          color: AppColors.current.primaryColor,
                          // padding: EdgeInsets.all(Dimens.d10.responsive()),
                          child: Row(children: [
                            SizedBox(width: Dimens.d15.responsive()),
                            Expanded(child: Text("Rút Tiền", style: AppTextStyles.s16w600(color: AppColors.current.whiteColor))),
                            Icon(Icons.arrow_right_rounded, size: Dimens.d50.responsive(), color: AppColors.current.whiteColor)
                          ]),
                        )),
                    GestureDetector(
                        onTap: () => navigator.push(const AppRouteInfo.chefSchedule()),
                        child: Container(
                          width: double.infinity,
                          height: Dimens.d60.responsive(),
                          alignment: Alignment.center,
                          color: AppColors.current.primaryColor,
                          // padding: EdgeInsets.all(Dimens.d10.responsive()),
                          child: Row(children: [
                            SizedBox(width: Dimens.d15.responsive()),
                            Expanded(child: Text("Sửa hồ sơ", style: AppTextStyles.s16w600(color: AppColors.current.whiteColor))),
                            Icon(Icons.arrow_right_rounded, size: Dimens.d50.responsive(), color: AppColors.current.whiteColor)
                          ]),
                        )),
                    GestureDetector(
                        onTap: () => navigator.push(const AppRouteInfo.chefSchedule()),
                        child: Container(
                          width: double.infinity,
                          height: Dimens.d60.responsive(),
                          alignment: Alignment.center,
                          color: AppColors.current.primaryColor,
                          // padding: EdgeInsets.all(Dimens.d10.responsive()),
                          child: Row(children: [
                            SizedBox(width: Dimens.d15.responsive()),
                            Expanded(child: Text("Lịch nhận việc trong tuần", style: AppTextStyles.s16w600(color: AppColors.current.whiteColor))),
                            Icon(Icons.arrow_right_rounded, size: Dimens.d50.responsive(), color: AppColors.current.whiteColor)
                          ]),
                        )),
            
                    //* setting
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) => previous.isDarkTheme != current.isDarkTheme,
                      builder: (context, state) {
                        return SwitchListTile.adaptive(
                          title: Text(
                            S.current.darkTheme,
                            style: AppTextStyles.s16w600(color: AppColors.current.whiteColor),
                          ),
                          tileColor: AppColors.current.primaryColor,
                          value: state.isDarkTheme,
                          onChanged: (isDarkTheme) => appBloc.add(
                            AppThemeChanged(isDarkTheme: isDarkTheme),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) => previous.languageCode != current.languageCode,
                      builder: (context, state) {
                        return SwitchListTile.adaptive(
                          title: Text(
                            S.current.japanese,
                            style: AppTextStyles.s16w600(color: AppColors.current.whiteColor),
                          ),
                          tileColor: AppColors.current.primaryColor,
                          value: state.languageCode == LanguageCode.ja,
                          onChanged: (isJa) => appBloc.add(
                            AppLanguageChanged(languageCode: isJa ? LanguageCode.ja : LanguageCode.en),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: Dimens.d15.responsive()),
                    //* logout
                    ElevatedButton(
                      // onPressed: () => bloc.add(const LogoutButtonPressed()),
                      onPressed: () => navigator.push(const AppRouteInfo.onboarding()),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
                      ),
                      child: Text(
                        S.current.logout,
                        style: AppTextStyles.s14w500(color: AppColors.current.whiteColor),
                      ),
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
