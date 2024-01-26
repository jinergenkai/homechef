import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';

import '../../app.dart';
import 'bloc/forgot_password.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage, ForgotPasswordBloc> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    bloc.add(const ForgotPasswordPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Quên Mật Khẩu",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Dimens.d24.responsive()),
                  AppTextField(
                    title: S.current.email + " để cài lại mật khẩu",
                    hintText: "nhập email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: Dimens.d24.responsive()),
                  CommonEllipseButon(
                    onPressed: () async {
                      await _resetPassword();
                      await showDialog(
                        context: context,
                        builder: (context) {
                          if (_emailController.text == null || _emailController.text.trim().isEmpty
                          || !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim())
                          ) {
                            //show error
                            return AlertDialog(
                              title: Text('Lỗi'),
                              content: Text('Email không hợp lệ'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    navigator.pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          }
                          return AlertDialog(
                            // title: Text('Password Reset Email Sent'),
                            title: Text('Kiểm tra Email Đã Được Gửi'),
                            content: Text(
                              // 'An email has been sent to ${_emailController.text} with instructions to reset your password.',
                              'Một email đã được gửi đến ${_emailController.text} với hướng dẫn để cài lại mật khẩu của bạn.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  navigator.popUntilRouteName("OnboardingRoute");
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'cài lại mật khẩu',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to reset the user's password
  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
    } catch (e) {
      print('Error sending password reset email: $e');
      // Handle the error, e.g., show an error message to the user
    }
  }
}
