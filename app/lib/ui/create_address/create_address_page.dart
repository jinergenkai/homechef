import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/create_address.dart';

@RoutePage()
class CreateAddressPage extends StatefulWidget {
  const CreateAddressPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateAddressPageState();
  }
}

class _CreateAddressPageState extends BasePageState<CreateAddressPage, CreateAddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const CreateAddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
        final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Create Address",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<CreateAddressBloc, CreateAddressState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(Dimens.d30.responsive()),
                  child: Column(children: [
                    AppTextField(
                      title: "ADDRESS",
                      hintText: "Enter address",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      suffixIcon: Assets.images.hiddenText,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "NAME OF PLACE",
                      hintText: "House number 1",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "CONTACT NAME",
                      hintText: "Nguyen Van A",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "PHONE NUMBER",
                      hintText: "0903 123 123",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      keyboardType: TextInputType.text,
                    ),
                  ])),
            );
          },
        ),
      ),
            //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !showFab?null: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
        child: CommonEllipseButon(
          onPressed: () {
            // navigator.push(const AppRouteInfo.createAddress());
          },
          text: "Create",
        ),
      ),

    );
  }
}
