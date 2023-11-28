import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            children: [
              // Logo
              Container(padding: EdgeInsets.all(Dimens.d40.responsive()), child: Assets.images.customerLauncherIcon.image(width: Dimens.d250.responsive(), height: Dimens.d250.responsive())),

              //login button
              CommonEllipseButon(
                onPress: () => {navigator.push(const AppRouteInfo.login())},
                text: S.current.signIn,
              ),
              SizedBox(
                height: Dimens.d25.responsive(),
              ),
              const CommonDivider(),
              SizedBox(height: Dimens.d25.responsive()),
              CommonEllipseButon(
                onPress: () => {},
                text: S.current.continueWithGoogle,
                color: const Color(0xff5384ee),
                textColor: AppColors.current.whiteColor,
                icon: Assets.images.googleIcon.svg(color: AppColors.current.whiteColor, height: Dimens.d30.responsive(), width: Dimens.d30.responsive()),
              ),
              CommonEllipseButon(
                onPress: () => {},
                text: S.current.continueWithFacebook,
                color: const Color(0xff0866ff),
                textColor: AppColors.current.whiteColor,
                icon: Icon(Icons.facebook, size: Dimens.d30.responsive()),
              ),
              CommonEllipseButon(
                onPress: () => {},
                color: const Color.fromARGB(255, 0, 0, 0),
                textColor: AppColors.current.whiteColor,
                text: S.current.continueWithApple,
                icon: Icon(Icons.apple, size: Dimens.d30.responsive()),
              ),
              SizedBox(height: Dimens.d30.responsive()),
              RichText(
                  text: TextSpan(
                text: S.current.doNotHaveAccount,
                style: AppTextStyles.s15w400(color: AppColors.current.blackColor),
                children: [
                  TextSpan(
                    text: S.current.signUp,
                    style: AppTextStyles.s15w600(color: AppColors.current.primaryColor),
                    recognizer: TapGestureRecognizer()..onTap = () => navigator.push(const AppRouteInfo.main()),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        height: Dimens.d1.responsive(),
        width: Dimens.d125.responsive(),
        color:const Color.fromARGB(255, 226, 226, 226),
      ),
      Text("  ${S.current.or}  ", style: AppTextStyles.s15w400(color: AppColors.current.blackColor)),
      Container(
        height: Dimens.d1.responsive(),
        width: Dimens.d125.responsive(),
        color:const Color.fromARGB(255, 226, 226, 226),
      ),
    ]);
  }
}
