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
  const ConfirmAndPayPage({super.key, required this.cookingOrder});

  final CookingOrder cookingOrder;

  @override
  State<StatefulWidget> createState() {
    return _ConfirmAndPayPageState();
  }
}

class _ConfirmAndPayPageState extends BasePageState<ConfirmAndPayPage, ConfirmAndPayBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(ConfirmAndPayPageInitiated(cookingOrder: widget.cookingOrder));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Xác nhận và thanh toán",
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
                        Row(children: [Assets.images.locationBlackPng.image(height: 30), SizedBox(width: 5), Text("Địa chỉ", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        SizedBox(height: 10),
                        AddressItem(
                          onPressed: () {
                            // navigator.push(const AppRouteInfo.chooseAddress());
                          },
                          // title: state.cookingOrder.address,
                          address: state.cookingOrder.address,
                        ),
                        SizedBox(height: 20),
                        //* Cooking order picked
                        Row(children: [Assets.images.orderList.image(height: 30), SizedBox(width: 5), Text("Thực đơn", style: AppTextStyles.s20w600(color: AppColors.current.blackColor))]),
                        BlurBorderContainer(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d10.responsive()),
                          margin: EdgeInsets.symmetric(vertical: Dimens.d10.responsive()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //* working time
                              Row(children: [
                                Expanded(child: Text("Thời gian", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                              ]),
                              Row(children: [
                                Expanded(child: Text("Ngày", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor))),
                                Text(state.cookingOrder.cookedTime),
                              ]),
                              Row(children: [
                                Expanded(child: Text("Trong khoảng", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor))),
                                Text(state.cookingOrder.cookedHour.toString() + 'h'),
                              ]),

                              //* Task Detail
                              Row(children: [
                                Expanded(child: Text("Chi tiết món", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                              ]),
                              Row(
                                children: [
                                  Expanded(child: Text("Số lượng người ăn", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor))),
                                  Text(state.cookingOrder.quantity.toString(), style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Text(
                                  "● " + state.cookingOrder.dish[index].name,
                                  style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                                ),
                                itemCount: state.cookingOrder.dish.length,
                              ),
                              const SizedBox(height: 5),
                              Text("Hương vị ưa thích: miền ${flavors[state.cookingOrder.dishType]}", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              const SizedBox(height: 5),
                              Text("Lựa chọn thêm:", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final option = (state.cookingOrder.option >> index) & 1;
                                    if (option == 0) {
                                      return const SizedBox.shrink();
                                    }
                                    return Text("● ${OptionMenuName[OptionMenu.values[index]]}", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor));
                                  },
                                  itemCount: OptionMenu.values.length),
                              const SizedBox(height: 5),
                              Text("Ghi chú: ${state.cookingOrder.note}", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                            ],
                          ),
                        ),
                        //* Enter Payment method
                        GestureDetector(
                          // onTap: () => navigator.push(const AppRouteInfo.choosePayment()),
                          child: Container(
                              height: 50,
                              width: double.infinity,
                              color: AppColors.current.primaryColor.withOpacity(0.1),
                              padding: EdgeInsets.all(Dimens.d5.responsive()),
                              child: Row(children: [
                                Expanded(child: Text("Phương thức thanh toán", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                Assets.images.vnd.image(),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    // alignment: Alignment.center,
                                    // onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()),
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_right_rounded, size: Dimens.d30.responsive()))
                              ])),
                        ),
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
                              Expanded(child: Text("Nhập mã giảm giá", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  // alignment: Alignment.center,
                                  // onPressed: () => navigator.push(const AppRouteInfo.chooseAddress()),
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_right_rounded, size: Dimens.d30.responsive()))
                            ])),

                        SizedBox(height: 10),
                        BorderContainer(
                          child: Column(
                            children: [
                              //* pre-calculated
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Giá tạm tính", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                    Text(NumberFormatUtils.formatNumber(state.cookingOrder.price) + " đ", style: AppTextStyles.s16w500(color: AppColors.current.primaryTextColor)),
                                  ])),

                              //* Voucher
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Voucher", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor))),
                                    Text('-' + "0 đ".padLeft(20), style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                                  ])),

                              Divider(
                                height: 20,
                                color: AppColors.current.blackColor.withOpacity(0.4),
                                endIndent: Dimens.d20.responsive(),
                                indent: Dimens.d20.responsive(),
                              ),
                              //* Total price
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d15.responsive(), vertical: Dimens.d5.responsive()),
                                  child: Row(children: [
                                    Expanded(child: Text("Tổng", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor))),
                                    Text(NumberFormatUtils.formatNumber(state.cookingOrder.price) + " đ", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
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
            // await showDialog(context: context, builder: (context) => AlertDialog(title: Text("Booked")));
            bloc.add(const BookButtonPressed());
          },
          text: "Đặt",
        ),
      ),
    );
  }
}
