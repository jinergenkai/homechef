import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import '../../common_view/blur_border_container.dart';
import 'bloc/confirm_and_pay.dart';

@RoutePage()
class ConfirmAndPayPage extends StatefulWidget {
  const ConfirmAndPayPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ConfirmAndPayPageState();
  }
}

class _ConfirmAndPayPageState extends BasePageState<ConfirmAndPayPage, ConfirmAndPayBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ConfirmAndPayPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Confirm and Pay",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<ConfirmAndPayBloc, ConfirmAndPayState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(Dimens.d20.responsive()),
                    child: Column(
                      children: [
                        //* Address location picked
                        Row(children: [Assets.images.locationBlackPng.image(height: 30), SizedBox(width: 5), Text("Location", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        SizedBox(height: 10),
                        AddressItem(
                          onPressed: () {
                            navigator.push(const AppRouteInfo.chooseAddress());
                          },
                          title: Text("Thành Phố Thủ Đức"),
                        ),
                        SizedBox(height: 20),
                        //* Cooking order picked
                        Row(children: [Assets.images.orderList.image(height: 30), SizedBox(width: 5), Text("Cooking Order", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        BlurBorderContainer(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d10.responsive()),
                          margin: EdgeInsets.symmetric(vertical: Dimens.d10.responsive()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //* working time
                              Row(children: [
                                Expanded(child: Text("Working time", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                IconButton(onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()), icon: Icon(Icons.edit))
                              ]),
                              Row(children: [Expanded(child: Text("Date", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor))), Text("Monday, 30/10/2023 - 11:30")]),
                              Row(children: [Expanded(child: Text("Duration", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor))), Text("2 hours, from 09:30 - 11:30")]),

                              //* Task Detail
                              Row(children: [
                                Expanded(child: Text("Task Detail", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                IconButton(onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()), icon: Icon(Icons.edit))
                              ]),
                              Text("People          7", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              Text("Rau muống nhồi thịt", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              Text("Ốc hương om chuối", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              Text("Ba ba xào tỏi", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              Text("Prefer style           Northern", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                            ],
                          ),
                        ),
                        //* Enter Payment method
                        Container(
                            height: 50,
                            width: double.infinity,
                            color: AppColors.current.primaryColor.withOpacity(0.1),
                            padding: EdgeInsets.all(Dimens.d5.responsive()),
                            child: Row(children: [
                              Expanded(child: Text("Payment Method", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                              Assets.images.vnd.image(),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  // alignment: Alignment.center,
                                  onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()),
                                  icon: Icon(Icons.arrow_right_rounded, size: Dimens.d30.responsive()))
                            ])),
                        Divider(
                          height: 1,
                          color: AppColors.current.blackColor.withOpacity(0.4),
                          endIndent: Dimens.d20.responsive(),
                          indent: Dimens.d20.responsive(),
                        ),
                        //* Enter Promotion code
                        Container(
                            height: 50,
                            width: double.infinity,
                            color: AppColors.current.primaryColor.withOpacity(0.1),
                            padding: EdgeInsets.all(Dimens.d5.responsive()),
                            child: Row(children: [
                              Expanded(child: Text("Enter Promotion code", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  // alignment: Alignment.center,
                                  onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()),
                                  icon: Icon(Icons.arrow_right_rounded, size: Dimens.d30.responsive()))
                            ])),

                        SizedBox(height: 10),
                        BorderContainer(
                          child: Column(
                            children: [
                              //* pre-calculated
                              Container(
                                  color: AppColors.current.primaryColor.withOpacity(0.1),
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Pre-Calculated", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                    Text("250 000 đ", style: AppTextStyles.s16w500(color: AppColors.current.primaryTextColor)),
                                  ])),

                              //* Voucher
                              Container(
                                  color: AppColors.current.primaryColor.withOpacity(0.1),
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Voucher", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                    Text("-50 000 đ", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                                  ])),

                              Divider(
                                height: 20,
                                color: AppColors.current.blackColor.withOpacity(0.4),
                                endIndent: Dimens.d20.responsive(),
                                indent: Dimens.d20.responsive(),
                              ),
                              //* Total price
                              Container(
                                  color: AppColors.current.primaryColor.withOpacity(0.1),
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Total", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor))),
                                    Text("200 000 đ", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                                  ])),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: Dimens.d60.responsive(),
                        )
                      ],
                    )));
          },
        ),
      ),
      //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
        child: CommonEllipseButon(
          onPressed: () async {
            await showDialog(context: context, builder: (context) => AlertDialog(title: Text("Booked")));
            bloc.add(const BookButtonPressed());
            navigator.showDialog(
              AppPopupInfo.confirmDialog(message: "Booked", onPressed: Func0(() async {
          })),
            );
            // navigator.push(const AppRouteInfo.createAddress());
          },
          text: "Book",
        ),
      ),
    );
  }
}
