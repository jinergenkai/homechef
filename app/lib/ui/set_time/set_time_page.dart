import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../choose_menu/choose_menu_page.dart';
import 'bloc/set_time.dart';

@RoutePage()
class SetTimePage extends StatefulWidget {
  const SetTimePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SetTimePageState();
  }
}

class _SetTimePageState extends BasePageState<SetTimePage, SetTimeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const SetTimePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Choose Cooking Time",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: BlocBuilder<SetTimeBloc, SetTimeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(Dimens.d10.responsive()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Title
                    CommonSmallTitle(text: "Working time"),

                    //* Date picker
                    Text("Date picker"),

                    //* Time picker
                    Text("Time picker"),

                    //* Estimated arrival time
                    Text("The Chef's estimated arrival time is 09:30"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive()),
          child: CommonEllipseButon(
            buttonType: ButtonEllipseType.checkout,
            action: "Next",
            price: 100,
            quantity: "123",
            onPressed: () {
              navigator.push(const AppRouteInfo.confirmAndPay());
            },
          )),
    );
  }
}
