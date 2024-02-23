import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/waiting_order.dart';

@RoutePage()
class WaitingOrderPage extends StatefulWidget {
  const WaitingOrderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WaitingOrderPageState();
  }
}

class _WaitingOrderPageState extends BasePageState<WaitingOrderPage, WaitingOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const WaitingOrderPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<WaitingOrderBloc, WaitingOrderState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.waitingOrders.length,
              itemBuilder: (context, index) {
                return GenericOrderItem(
                  onPressed: () {
                    // navigator.push(const AppRouteInfo.main())() async{
                    navigator.push(AppRouteInfo.detailWaitingOrder(state.waitingOrders[index]));
                  },
                  cookingOrder: state.waitingOrders[index],
                  index: index,
                );
              },
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
  });

  final Function? onPressed;
  final CookingOrder? cookingOrder;
  final int index;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // *** Title
                Text("#" + "${index + 1} ".padLeft(3, "0") + (cookingOrder?.customer.fullName ?? "Ẩn Danh" + " - " + (cookingOrder?.address.district ?? "Vô Định")),
                    style: AppTextStyles.s20w600(color: AppColors.current.blackColor)),
                const Divider(),
                // *** Overview
                Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.1),
                      1: FlexColumnWidth(0.9),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        Assets.images.timer.image(color: AppColors.current.primaryColor),
                        Text(modifyTimeFormat(cookingOrder?.cookedTime ?? "Now")),
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
                                  "● " + (cookingOrder?.dish[index - 1].name ?? ""),
                                  style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                                ),
                          itemCount: (cookingOrder?.dish.length ?? 0) + 1,
                        ),
                      ]),
                      TableRow(children: [
                        Assets.images.dollar.image(color: AppColors.current.primaryColor),
                        Text(NumberFormatUtils.formatNumber(cookingOrder?.price ?? 0) + " VND"),
                      ]),
                      TableRow(children: [
                        Assets.images.location.image(color: AppColors.current.primaryColor),
                        Text((cookingOrder?.address.street ?? "Vô định") + ", " + (cookingOrder?.address.district ?? "Vô Định")),
                      ]),
                      TableRow(children: [
                        // Assets.images.location.image(color: AppColors.current.primaryColor),
                        Icon(
                          Icons.note,
                          size: 18,
                          color: AppColors.current.primaryColor,
                        ),
                        Text(cookingOrder?.note ?? ""),
                      ]),
                    ]),

                // *** Action
                const SizedBox(
                  height: 5,
                ),
                Align(alignment: Alignment.center, child: CommonSmallButton(onpressed: onPressed, text: "Chi Tiết")),
                const Divider(),
                //               Row(
                //   children: [
                //     Assets.images.user.image(),
                //     Text(" Waiting for chef to accept...", style: AppTextStyles.s16w500(color: AppColors.current.primaryColor), overflow: TextOverflow.ellipsis),
                //   ],
                // ),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        // WidgetSpan(child: Assets.images.user.image(color: AppColors.current.primaryColor)),
                        // WidgetSpan(child: Icon(Icons.search_rounded, size: 20, color: AppColors.current.primaryColor)),
                        TextSpan(
                          text: "  Chờ đầu bếp chấp nhận...${cookingOrder?.cookedHour}",
                          style: AppTextStyles.s16w500(color: AppColors.current.primaryColor),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
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
          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d10.responsive()),
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
