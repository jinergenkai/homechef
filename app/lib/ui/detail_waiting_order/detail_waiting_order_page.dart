import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared/shared.dart';
import 'package:image_picker/image_picker.dart';

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
        text: "Order ${widget.cookingOrder.id.substring(0, 4)}",
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
                        SizedBox(height: 20),
                        // ((state.cookingOrder.status == OrderStatus.PROCESSING || state.cookingOrder.status == OrderStatus.COMPLETED) && state.cookingOrder.transaction[0].imageUrl != null)
                        // ?
                        (state.cookingOrder.status == OrderStatus.PROCESSING.index || state.cookingOrder.status == OrderStatus.COMPLETED.index)
                            ? Column(
                                children: [
                                  CardChefProfile(
                                    // onPressed: () => navigator.push(const AppRouteInfo.chefProfile()),
                                    fullName: (state.cookingOrder?.chef.fullName.isEmpty ?? true) ? "ChefName" : state.cookingOrder?.chef.fullName,
                                    // biography: cookingOrder?.chef.biography,
                                    image: Image.network("https://img.timviec.com.vn/2021/10/chef-la-gi-4.jpg").image,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(height: 10),
                        (state.cookingOrder.transaction != null && state.cookingOrder.transaction.length > 0 && state.cookingOrder.transaction[0].imageUrl.isNotEmpty) ? Image.network(state.cookingOrder.transaction[0].imageUrl) : SizedBox(),

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
                  // if (state.cookingOrder.status == 0) {
                  if (state.cookingOrder.status == OrderStatus.PROCESSING.index) {
                    if(state.cookingOrder.transaction != null && state.cookingOrder.transaction.length > 0 && state.cookingOrder.transaction[0].imageUrl.isNotEmpty) {
                      return const SizedBox();
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                      child: CommonEllipseButon(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                File? _image;

                                return StatefulBuilder(builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text("Thanh Toán: ${NumberFormatUtils.formatNumber(state.cookingOrder.price)} đ", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                                    content: Column(
                                      children: [
                                        //Quý khách vui quét mã QR, chuyển số tiền trên với cú pháp: ***${state.cookingOrder.id.substring(0,4)} <email đăng ký> <số tiền thanh toán> và đăng hình ảnh để Homechef xác nhận nhé
                                        RichText(
                                          text: TextSpan(
                                            text: "Quý khách vui quét mã QR\nTheo cú pháp: \n",
                                            style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
                                            children: [
                                              TextSpan(
                                                text: "${state.cookingOrder.id.substring(0, 4)} <email> <số tiền>",
                                                style: TextStyle(fontSize: 20, color: Colors.orange, fontStyle: FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Assets.images.qrcode.image(),
                                        SizedBox(height: 10),
                                        Text(
                                          "Upload hình ảnh giao dịch để Homechef xác nhận nhé",
                                          style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        //upload image
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            children: [
                                              CommonSmallButton(
                                                onpressed: () async {
                                                  _image = null;
                                                  final picker = ImagePicker();
                                                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                                                  setState(() {
                                                    if (pickedFile != null) {
                                                      _image = File(pickedFile.path);
                                                    } else {
                                                      print('No image selected.');
                                                    }
                                                  });
                                                },
                                                text: "Upload",
                                              ),
                                              SizedBox(width: 20),
                                              Text(_image == null ? "" : "verify.png"),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox(height: 30)),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: CommonEllipseButon(
                                            onPressed: () async {
                                              if (_image == null) {
                                                return;
                                              }
                                              bloc.add(CompleteButtonPressed(image: _image!));
                                            },
                                            text: "Duyệt",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              });
                          // bloc.add(const AcceptButtonPressed());
                        },
                        text: "Hoàn Thành",
                      ),
                    );
                  }
                  //* completed & rating bar
                  else if (state.cookingOrder.status == OrderStatus.COMPLETED.index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                      child: CommonEllipseButon(
                        onPressed: () async {
                          // await showDialog(context: context, builder: (context) => AlertDialog(title: Text("Booked")));
                          // bloc.add(const AcceptButtonPressed());

                          //show dialog to rate 1 - 5 stars with submit button
                          await showDialog(
                              context: context,
                              builder: (context) {
                                int _rating = 0;
                                return StatefulBuilder(builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text("Đánh giá", style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                                    content: Container(
                                      // height: 100,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: _rating.toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              _rating = rating.toInt();
                                            },
                                          ),
                                          SizedBox(height: 10),
                                          CommonSmallButton(
                                            onpressed: () async {
                                              // await bloc.add(RateButtonPressed(rating: _rating));
                                              navigator.push(const AppRouteInfo.main());
                                            },
                                            text: "Submit",
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
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
                                    title: Text("Bạn có chắc chắn muốn hủy đơn?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("đổi ý"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          bloc.add(const CancelButtonPressed());
                                          Navigator.pop(context);
                                        },
                                        child: Text("đồng ý"),
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
