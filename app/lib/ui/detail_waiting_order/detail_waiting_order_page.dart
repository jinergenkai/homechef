import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/detail_waiting_order.dart';

@RoutePage()
class DetailWaitingOrderPage extends StatefulWidget {
  const DetailWaitingOrderPage({required this.cookingOrder, super.key});

  final CookingOrder cookingOrder;

  @override
  State<StatefulWidget> createState() {
    return _DetailWaitingOrderPageState();
  }
}

class _DetailWaitingOrderPageState extends BasePageState<DetailWaitingOrderPage, DetailWaitingOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(DetailWaitingOrderPageInitiated(order: widget.cookingOrder));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Order - ${widget.cookingOrder.customer.fullName}",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<DetailWaitingOrderBloc, DetailWaitingOrderState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(Dimens.d20.responsive()),
                    child: Column(
                      children: [
                        //* Address location picked
                        Row(children: [Assets.images.locationBlackPng.image(height: 30), SizedBox(width: 5), Text("Địa chỉ", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        SizedBox(height: 10),
                        AddressItem(
                          onPressed: () {
                            // navigator.push(const AppRouteInfo.chooseAddress());
                          },
                          // title: state.cookingOrder.address,
                          address: state.cookingOrder.address,
                        ),
                        SizedBox(height: 10),
                        //* Cooking order picked
                        Row(children: [Assets.images.orderList.image(height: 30), SizedBox(width: 5), Text("Thực đơn", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        DetailOrderItem(cookingOrder: state.cookingOrder),

                        SizedBox(height: 5),
                        BorderContainer(
                          child: Column(
                            children: [
                              // Divider(
                              //   height: 20,
                              //   color: AppColors.current.blackColor.withOpacity(0.4),
                              //   endIndent: Dimens.d20.responsive(),
                              //   indent: Dimens.d20.responsive(),
                              // ),
                              //* Total price
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Giá", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                    Text(NumberFormatUtils.formatNumber(state.cookingOrder.price) + " đ", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                                  ])),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: Dimens.d60.responsive(),
                        ),
                        // CommonSmallButton(onpressed: () {}, text: "Nhận việc"),
                      ],
                    )));
          },
        ),
      ),
      //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          //* user role
          if (!state.isDarkTheme) {
            return BlocBuilder<DetailWaitingOrderBloc, DetailWaitingOrderState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  //* processing
                  if (state.cookingOrder.status == OrderStatus.PROCESSING) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                      child: CommonEllipseButon(
                        onPressed: () async {
                          await showDialog(context: context, builder: (context) => AlertDialog(title: Assets.images.qrcode.image()));
                          // bloc.add(const AcceptButtonPressed());
                        },
                        text: "Hoàn Thành",
                      ),
                    );
                  }
                  //* completed
                  else if (state.cookingOrder.status == OrderStatus.COMPLETED) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                      child: CommonEllipseButon(
                        onPressed: () async {
                          // await showDialog(context: context, builder: (context) => AlertDialog(title: Text("Booked")));
                          // bloc.add(const AcceptButtonPressed());
                        },
                        text: "Đánh giá",
                      ),
                    );
                  }
                  //* pending
                  else {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                      child: CommonEllipseButon(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Are you sure to cancel this order?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          bloc.add(const CancelButtonPressed());
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes"),
                                      )
                                    ],
                                  ));
                        },
                        text: "Hủy Đơn",
                        color: AppColors.current.redColor.withOpacity(0.8),
                      ),
                    );
                  }
                });
          }
          //* chef role
          return BlocBuilder<DetailWaitingOrderBloc, DetailWaitingOrderState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state.cookingOrder.status == OrderStatus.PENDING.index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                  child: CommonEllipseButon(
                    onPressed: () async {
                      // await showDialog(context: context, builder: (context) => AlertDialog(title: Text("Booked")));
                      bloc.add(const AcceptButtonPressed());
                    },
                    text: "Nhận Việc",
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
