import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:resources/resources.dart';

import '../../app.dart';
import 'bloc/onboarding.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnboardingPageState();
  }
}

class _OnboardingPageState extends BasePageState<OnboardingPage, OnboardingBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const OnboardingPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) => previous.isDarkTheme != current.isDarkTheme,
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(Dimens.d16.responsive()),
              child: Column(
                children: [
                  // Logo
                  !state.isDarkTheme
                      ? Container(padding: EdgeInsets.all(Dimens.d40.responsive()), child: Assets.images.customerLauncherIcon.image(width: Dimens.d250.responsive(), height: Dimens.d250.responsive()))
                      : Container(
                          width: 300.0, // Điều chỉnh kích thước của hình tròn tại đây
                          height: 300.0,
                          margin: EdgeInsets.all(Dimens.d20.responsive()),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Assets.images.chefLauncherIcon.image(width: Dimens.d400.responsive(), height: Dimens.d400.responsive()).image,
                            ),
                          ),
                        ),

                  //login button
                  CommonEllipseButon(
                    onPressed: () => {navigator.push(const AppRouteInfo.login())},
                    text: S.current.signIn,
                  ),
                  CommonEllipseButon(
                    onPressed: () async {
                      // AppThemeSetting.currentAppThemeType = AppThemeType.medium;
                      // navigator.push(const AppRouteInfo.chefMain());
                      // bloc.add(const OnChangedRole());
                      appBloc.add(AppThemeChanged(isDarkTheme: !state.isDarkTheme));
                      // delay 300ms
                      await Future.delayed(const Duration(milliseconds: 300));
                      navigator.popAndPush(const AppRouteInfo.onboarding());
                    },
                    text: "Continue as ${state.isDarkTheme ? "Customer" : "Chef"}",
                    // text: "Continue as Chef",
                    color: AppColors.current.chefPrimaryColor,
                    textColor: AppColors.current.whiteColor,
                    // icon: Icon(Icons.facebook, size: Dimens.d30.responsive()),
                  ),
                  SizedBox(height: Dimens.d10.responsive()),
                  const CommonDivider(),
                  SizedBox(height: Dimens.d10.responsive()),
                  CommonEllipseButon(
                    onPressed: () => {},
                    text: S.current.continueWithGoogle,
                    color: const Color(0xff5384ee),
                    textColor: AppColors.current.whiteColor,
                    icon: Assets.images.googleIcon.svg(color: AppColors.current.whiteColor, height: Dimens.d30.responsive(), width: Dimens.d30.responsive()),
                  ),
                  // CommonEllipseButon(
                  //   onPressed: () => {},
                  //   text: S.current.continueWithFacebook,
                  //   color: const Color(0xff0866ff),
                  //   textColor: AppColors.current.whiteColor,
                  //   icon: Icon(Icons.facebook, size: Dimens.d30.responsive()),
                  // ),
                  CommonEllipseButon(
                    onPressed: () => {},
                    color: const Color.fromARGB(255, 0, 0, 0),
                    textColor: AppColors.current.whiteColor,
                    text: S.current.continueWithApple,
                    icon: Icon(Icons.apple, size: Dimens.d30.responsive()),
                  ),
                  SizedBox(height: Dimens.d30.responsive()),
                  RichText(
                      text: TextSpan(
                    text: S.current.doNotHaveAccount,
                    style: AppTextStyles.s16w500(color: AppColors.current.blackColor),
                    children: [
                      TextSpan(
                        text: S.current.signUp,
                        style: AppTextStyles.s16w600(color: AppColors.current.primaryColor),
                        recognizer: TapGestureRecognizer()..onTap = () => navigator.push(const AppRouteInfo.signUp()),
                      )
                    ],
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
