import 'package:auto_route/auto_route.dart';
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
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: Dimens.d15.responsive()),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.onPageError != current.onPageError,
                builder: (_, state) => Text(
                  state.onPageError,
                  style: AppTextStyles.s14w500Secondary(),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.isLoginButtonEnabled != current.isLoginButtonEnabled,
                builder: (context, state) {
                  return CommonEllipseButon(
                    onPressed: state.isLoginButtonEnabled ? () => bloc.add(const LoginButtonPressed()) : null,
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
              SizedBox(height: Dimens.d15.responsive()),
              CommonEllipseButon(
                onPressed: () => bloc.add(const FakeLoginButtonPressed()),
                text: S.current.fakeLogin,
              ),
              CommonEllipseButon(
                onPressed: () => bloc.add(const FakeLoginButtonPressed()),
                text: S.current.fakeLogin,
                icon: Icon(Icons.facebook, size: Dimens.d40.responsive()),
              ),
              CommonEllipseButon(
                onPressed: () => bloc.add(const FakeLoginButtonPressed()),
                text: S.current.fakeLogin,
                color: AppColors.current.primaryColor,
                textColor: AppColors.current.secondaryColor,
                buttonType: ButtonEllipseType.checkout,
              ),
              CommonEllipseButon(
                  onPressed: () => bloc.add(const FakeLoginButtonPressed()),
                  text: S.current.fakeLogin,
                  color: AppColors.current.primaryColor,
                  textColor: AppColors.current.secondaryColor,
                  buttonType: ButtonEllipseType.inverse),
              ElevatedButton(
                onPressed: () => bloc.add(const FakeLoginButtonPressed()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
                ),
                child: Text(
                  S.current.fakeLogin,
                  style: AppTextStyles.s14w500Primary(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
