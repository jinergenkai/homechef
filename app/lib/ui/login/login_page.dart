import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';

import '../../app.dart';
import 'bloc/login.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    // logD(MediaQuery.of(context).size.height.toString());
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: S.current.signIn,
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.5,
      ),
      // appBar: CommonAppBar(
      //   leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.close : LeadingIcon.none,
      //   leadingIconColor: AppColors.current.secondaryColor,
      //   titleType: AppBarTitle.text,
      //   centerTitle: true,
      //   text: S.current.login,
      //   backgroundColor: AppColors.current.primaryColor,
      //   titleTextStyle: AppTextStyles.s14w500Primary(),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.d24.responsive()),
          child: Column(
            children: [
              AppTextField(
                title: S.current.phoneNumber,
                hintText: S.current.enterYourPhoneNumber,
                onChanged: (email) => bloc.add(EmailTextFieldChanged(email: email)),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Dimens.d24.responsive()),
              AppTextField(
                title: S.current.password,
                hintText: S.current.enterPassword,
                onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                obscureText: true,
                suffixIcon: Assets.images.hiddenText,
                keyboardType: TextInputType.visiblePassword,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.onPageError != current.onPageError,
                builder: (_, state) => state.onPageError != ""
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(Dimens.d8.responsive()),
                        child: Text(
                          state.onPageError,
                          style: AppTextStyles.s16w500(color: AppColors.current.redColor),
                        ),
                      )
                    : Container(),
              ),
              SizedBox(height: Dimens.d10.responsive()),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Forgot password?", style: AppTextStyles.s16w600Secondary()),
              ),
              SizedBox(height: Dimens.d32.responsive()),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.isLoginButtonEnabled != current.isLoginButtonEnabled,
                builder: (context, state) {
                  return CommonEllipseButon(
                    onPressed: state.isLoginButtonEnabled ? () => bloc.add(const FakeLoginButtonPressed()) : null,
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor.withOpacity(state.isLoginButtonEnabled ? 1 : 0.5)),
                    // ),
                    // child: Text(
                    //   S.current.signIn,
                    //   style: AppTextStyles.s14w500Primary(),
                    // ),
                    text: S.current.signIn,
                  );
                },
              ),
              SizedBox(height: Dimens.d24.responsive()),
              const CommonDivider(),
              SizedBox(height: Dimens.d25.responsive()),
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(1);
                          navigator.push(const AppRouteInfo.chefMain());
                        })
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
