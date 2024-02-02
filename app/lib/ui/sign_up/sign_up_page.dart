import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';

import '../../app.dart';
import '../../utils/firebase_util.dart';
import 'bloc/sign_up.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends BasePageState<SignUpPage, SignUpBloc> {
  static final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    bloc.add(const SignUpPageInitiated());
  }

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
        text: S.current.signUp,
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
                title: "Email",
                hintText: "Nhập Email",
                onChanged: (email) => bloc.add(EmailTextFieldChanged(email: email)),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Dimens.d24.responsive()),
              AppTextField(
                title: "Họ và tên",
                hintText: "nhập họ và tên",
                onChanged: (username) => bloc.add(UsernameTextFieldChanged(username: username)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: Dimens.d24.responsive()),
              AppTextField(
                title: "Mật khẩu",
                hintText: "Nhập mật khẩu",
                onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                obscureText: true,
                suffixIcon: Assets.images.hiddenText,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: Dimens.d24.responsive()),
              AppTextField(
                title: "Mật khẩu",
                hintText: "Nhập lại mật khẩu",
                // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                obscureText: true,
                suffixIcon: Assets.images.hiddenText,
                keyboardType: TextInputType.visiblePassword,
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
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
              SizedBox(height: Dimens.d32.responsive()),
              BlocBuilder<SignUpBloc, SignUpState>(
                buildWhen: (previous, current) => previous.isSignUpButtonEnabled != current.isSignUpButtonEnabled,
                builder: (context, state) {
                  return CommonEllipseButon(
                      onPressed: () => bloc.add(const SignUpButtonPressed()),

                      // style: ButtonStyle(
                      //   backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor.withOpacity(state.isLoginButtonEnabled ? 1 : 0.5)),
                      // ),
                      // child: Text(
                      //   S.current.signIn,
                      //   style: AppTextStyles.s14w500Primary(),
                      // ),
                      text: "Đăng Ký");
                },
              ),
              SizedBox(height: Dimens.d30.responsive()),
              RichText(
                  text: TextSpan(
                text: "Đã có tài khoản? ",
                style: AppTextStyles.s16w500(color: AppColors.current.blackColor),
                children: [
                  TextSpan(
                      text: "Đăng Nhập",
                      style: AppTextStyles.s16w600(color: AppColors.current.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigator.popAndPush(const AppRouteInfo.login());
                        })
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
  //   Future<AuthStatus> resetPassword({required String email}) async {
  //   await auth
  //       .sendPasswordResetEmail(email: email)
  //       .then((value) => _status = AuthStatus.successful)
  //       .catchError(
  //           (e) => _status = AuthExceptionHandler.handleAuthException(e));

  //   return _status;
  // }
}
