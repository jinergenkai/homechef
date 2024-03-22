import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/waiting_order.dart';

@RoutePage()
class WaitingOrderPage extends StatefulWidget {
  const WaitingOrderPage({required this.role, required this.status, super.key});

  final int role;
  final OrderStatus status;

  @override
  State<StatefulWidget> createState() {
    return _WaitingOrderPageState();
  }
}

class _WaitingOrderPageState extends BasePageState<WaitingOrderPage, WaitingOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(WaitingOrderPageInitiated(widget.role, widget.status));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<WaitingOrderBloc, WaitingOrderState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () {
                bloc.add(WaitingOrderPageInitiated(widget.role, widget.status));
                return Future<void>.value();
              },
              child: ListView.builder(
                // shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.waitingOrders.length,
                itemBuilder: (context, index) {
                  return GenericOrderItem(
                    onPressed: () {
                      navigator.push(AppRouteInfo.detailWaitingOrder(state.waitingOrders[index]));
                    },
                    cookingOrder: state.waitingOrders[index],
                    index: index,
                    isChefUser: state.isChefUser,
                    status: widget.status,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class GenericOrderItem extends StatelessWidget {
  const GenericOrderItem({
    super.key,
    this.onPressed,
    this.cookingOrder,
    this.index = 0,
    this.isChefUser,
    this.status,
  });

  final Function? onPressed;
  final CookingOrder? cookingOrder;
  final int index;
  final bool? isChefUser;
  final OrderStatus? status;

  @override
  Widget build(BuildContext context) {
    return
        // InkWell(
        //   onTap: () {
        //     onPressed?.call();
        //   },
        // child:
        Container(
            decoration: BoxDecoration(
              color: AppColors.current.whiteColor,
              borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
              boxShadow: [
                BoxShadow(
                  color: AppColors.current.blackColor.withOpacity(0.03),
                  spreadRadius: 2,
                  blurRadius: 5,
                  // offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: Dimens.d12.responsive(),
              vertical: Dimens.d6.responsive(),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.d10.responsive(),
              vertical: Dimens.d10.responsive(),
            ),
            child: GestureDetector(
              onTap: () {
                onPressed?.call();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // *** Title
                  // Text("#" + "${index + 1} ".padLeft(3, "0") + (cookingOrder?.customer.fullName ?? "Ẩn Danh" + " - " + (cookingOrder?.address.district ?? "Vô Định")),
                  Text("#" + "${cookingOrder?.id.substring(0, 4)} - ".padLeft(4, "0") + (cookingOrder?.customer.fullName ?? "Ẩn Danh" + " - " + (cookingOrder?.address.district ?? "Vô Định")),
                      style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                  const Divider(),
                  // *** Overview
                  Table(
                      columnWidths: const {
                        0: FlexColumnWidth(0.15),
                        1: FlexColumnWidth(0.85),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          Assets.images.timer.image(color: AppColors.current.primaryColor),
                          Text(modifyTimeFormat(cookingOrder?.cookedTime ?? "Now"), style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                        ]),
                        TableRow(children: [
                          Assets.images.checkList.image(color: AppColors.current.primaryColor),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => index == 0
                                ? Text(
                                    "Món ăn",
                                    style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                                  )
                                : Text(
                                    "•  " + (cookingOrder?.dish[index - 1].name ?? ""),
                                    style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                                  ),
                            itemCount: (cookingOrder?.dish.length ?? 0) + 1,
                          ),
                        ]),
                        TableRow(children: [
                          Assets.images.dollar.image(color: AppColors.current.primaryColor),
                          Text(NumberFormatUtils.formatNumber(cookingOrder?.price ?? 0) + " VND", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                        ]),
                        TableRow(children: [
                          Assets.images.location.image(color: AppColors.current.primaryColor),
                          Text((cookingOrder?.address.street ?? "Vô định") + ", " + (cookingOrder?.address.district ?? "Vô Định"),
                              style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                        ]),
                        TableRow(children: [
                          // Assets.images.location.image(color: AppColors.current.primaryColor),
                          Icon(
                            Icons.note,
                            size: 18,
                            color: AppColors.current.primaryColor,
                          ),
                          Text(!(cookingOrder == null || cookingOrder!.note!.isEmpty) ? cookingOrder?.note ?? "không có" : "Không có",
                              style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor)),
                        ]),
                      ]),

                  SizedBox(
                    height: Dimens.d15.responsive(),
                  ),
                  // Align(alignment: Alignment.center, child: CommonSmallButton(onpressed: onPressed, text: "Chi Tiết")),
                  const Divider(),

                  //* Status pending
                  (status == OrderStatus.PENDING)
                      ? Container(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                WidgetSpan(child: Icon(Icons.search_rounded, size: 20, color: AppColors.current.primaryColor)),
                                TextSpan(
                                  text: (isChefUser ?? false) ? " Order trực tiếp cho bạn" : "  Chờ đầu bếp chấp nhận...",
                                  style: AppTextStyles.s16w500(color: AppColors.current.primaryColor),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      //* Status processing and completed
                      : ((status == OrderStatus.PROCESSING || status == OrderStatus.COMPLETED)
                          ? ((isChefUser == true)
                              ? Column(
                                  children: [
                                    CardChefProfile(
                                        // onPressed: () => navigator.push(const AppRouteInfo.chefProfile()),
                                        fullName: (cookingOrder?.customer.fullName.isEmpty ?? true) ? "CustomerName" : cookingOrder?.customer.fullName,
                                        // biography: cookingOrder?.chef.biography,
                                        // image: Image.network("https://i.pravatar.cc/300?img=${index + 20}").image,
                                        image: (cookingOrder?.customer.fullName == "Trịnh Khánh Linh")
                                            ? Image.network(
                                                    "https://scontent.fsgn2-7.fna.fbcdn.net/v/t1.6435-9/165758771_2803092326609279_8302707998078273124_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFdZpC9KUS8Zcre0ZlPjjy8SmdfDsBMZH5KZ18OwExkfiQdfJTU6put3wQl7APh3-Q2mcTddakr-chd7SbJxQzX&_nc_ohc=yQCpliivWswAX_cF4cU&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfDH2Puw6YMaX7OG-MoSVy_aD26KUvh-BueehvCb87mr4w&oe=66252E8B")
                                                .image
                                            : Image.network("https://i.pravatar.cc/300?img=${index + 20}").image),
                                  ],
                                )
                              : Column(
                                  children: [
                                    CardChefProfile(
                                      // onPressed: () => navigator.push(const AppRouteInfo.chefProfile()),
                                      fullName: (cookingOrder?.chef.fullName.isEmpty ?? true) ? "ChefName" : cookingOrder?.chef.fullName,
                                      // biography: cookingOrder?.chef.biography,
                                      // image: Image.network("https://i.pravatar.cc/300?img=${index + 20}").image,
                                      image: Image.network("https://img.timviec.com.vn/2021/10/chef-la-gi-4.jpg").image,
                                    ),
                                  ],
                                ))
                          : Container()),
                ],
              ),
            )
            // ),
            );
  }
}

class CommonSmallButton extends StatelessWidget {
  const CommonSmallButton({
    super.key,
    this.onpressed,
    this.text,
    this.color,
    this.textColor,
  });

  final Function? onpressed;
  final String? text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.current.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d8.responsive())),
          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d3.responsive()),
        ),
        onPressed: onpressed as void Function()?,
        child: Text(text ?? "Button", style: AppTextStyles.s14w500(color: textColor ?? AppColors.current.whiteColor)));
  }
}

String modifyTimeFormat(String originalTime) {
  RegExp regex = RegExp(r'^(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}).*');
  RegExpMatch? match = regex.firstMatch(originalTime);
  if (match != null) {
    String datePart = match.group(1) ?? "0000";
    String timePart = match.group(2) ?? "00:00";
    return '$datePart $timePart';
  }
  return originalTime;
}

String revertModifyTimeFormat(String originalTime) {
  RegExp regex = RegExp(r'^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2})$');
  RegExpMatch? match = regex.firstMatch(originalTime);
  if (match != null) {
    String datePart = match.group(1) ?? "0000";
    String timePart = match.group(2) ?? "00:00";
    return '${datePart}T${timePart}:00.000Z';
  }
  return originalTime;
}
