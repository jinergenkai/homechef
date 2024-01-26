import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';

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
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
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
                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: Assets.images.avatarChef.image().image, fit: BoxFit.cover))),
                  Column(
                    children: [
                      //* Name
                      Text(
                        "Tommy Phạm",
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
              Assets.images.wallet.image(),
              SizedBox(height: Dimens.d20.responsive()),
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
      ),
    );
  }
}
