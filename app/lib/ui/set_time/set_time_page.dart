import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import '../../common_view/border_container.dart';
import 'bloc/set_time.dart';

@RoutePage()
class SetTimePage extends StatefulWidget {
  const SetTimePage({super.key, required this.cookingOrder});

  final CookingOrder cookingOrder;

  @override
  State<StatefulWidget> createState() {
    return _SetTimePageState();
  }
}

class _SetTimePageState extends BasePageState<SetTimePage, SetTimeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(SetTimePageInitiated(order: widget.cookingOrder));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Thời gian - Địa điểm",
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
                padding: EdgeInsets.all(Dimens.d20.responsive()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Date picker
                    BlocBuilder<SetTimeBloc, SetTimeState>(
                      buildWhen: (previous, current) => previous.time != current.time,
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: state.time ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 30)),
                            ).then((date) {
                              if (date != null) {
                                bloc.add(ChangedDate(date: date));
                              }
                            });
                          },
                          child: BorderContainer(
                              // height: 100,
                              color: AppColors.current.disabledColor,
                              padding: EdgeInsets.all(Dimens.d15.responsive()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ngày", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      // height: 150,
                                      child: CarouselSliderMutiple(startDay: state.time ?? DateTime.now())),
                                ],
                              )),
                        );
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //* Time picker
                    GestureDetector(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          // initialTime: const TimeOfDay(hour: 10, minute: 47),
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        ).then((time) {
                          if (time != null) {
                            bloc.add(ChangedTime(time: time));
                          }
                        });
                      },
                      child: BorderContainer(
                          padding: EdgeInsets.all(Dimens.d15.responsive()),
                          child: Row(children: [
                            Assets.images.clock.image(),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Thời gian", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IntrinsicWidth(
                                  child: BlocBuilder<SetTimeBloc, SetTimeState>(
                                    buildWhen: (previous, current) => previous.time != current.time,
                                    builder: (context, state) {
                                      return BorderContainer(
                                          padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d8.responsive()),
                                          child: Row(
                                            children: [
                                              Text(state.time?.hour.toString() ?? "", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor)),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: Dimens.d10.responsive()),
                                                height: Dimens.d20.responsive(),
                                                width: Dimens.d1.responsive(),
                                                color: AppColors.current.primaryColor,
                                              ),
                                              Text(state.time?.minute.toString() ?? " ", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor)),
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              ),
                            )
                          ])),
                    ),

                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    BorderContainer(
                        padding: EdgeInsets.all(Dimens.d15.responsive()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nấu sẵn mang đến nhà", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                            StyledSwitch(
                              enabledColor: AppColors.current.primaryColor,
                              onToggled: (value) {
                                bloc.add(OptionChanged(option: OptionMenu.cookAndDelivery, isSelected: value));
                              },
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    BlocBuilder<SetTimeBloc, SetTimeState>(
                      buildWhen: (previous, current) => previous.cookingOrder.address != current.cookingOrder.address,
                      builder: (context, state) {
                        return BorderAddressItem(
                          onPressed: () {
                            bloc.add(const ChangedAddress());
                          },
                          address: state.cookingOrder.address,
                        );
                      },
                    ),
                    //* Estimated arrival time
                    Container(
                        padding: EdgeInsets.all(5),
                        // child: Text("The Chef's estimated arrival time is ${DateTime.now().toStringWithFormat("dd/MM")}", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor))),
                        child: Text("Thời gian ước tính đầu bếp đến địa điểm nấu là ${DateTime.now().toStringWithFormat("hh:mm dd/MM")}",
                            style: AppTextStyles.s16w600(color: AppColors.current.primaryColor))),
                    const SizedBox(height: 100),
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
          child: BlocBuilder<SetTimeBloc, SetTimeState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return CommonEllipseButon(
                buttonType: ButtonEllipseType.checkout,
                action: "Tiếp theo",
                price: state.cookingOrder.price.toDouble(),
                quantity: state.cookingOrder.cookedHour.toDouble(),
                onPressed: () {
                  navigator.push(AppRouteInfo.confirmAndPay(state.cookingOrder));
                },
              );
            },
          )),
    );
  }
}

List<String> getFutureDateStrings(DateTime currentDay, int numberOfDays, String pattern) {
  List<String> dateStrings = [];

  for (int i = 0; i < numberOfDays; i++) {
    DateTime currentDate = currentDay.add(Duration(days: i));
    String formattedDate = DateFormat(pattern).format(currentDate);
    dateStrings.add(formattedDate);
  }

  return dateStrings;
}

// final List<int> dateList = [10, 20, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

class CarouselSliderMutiple extends StatelessWidget {
  // https://stackoverflow.com/questions/64716588/multiple-items-in-one-slide-flutter-dart
  CarouselSliderMutiple({required this.startDay, super.key});
  final int numPerFrame = 4;
  final startDay;

  late List<String> dateList;
  late int firstDay;
  final List<String> weekdays = ["CN", "T2", "T3", "T4", "T5", "T6", "T7"];

  @override
  Widget build(BuildContext context) {
    dateList = getFutureDateStrings(startDay, 20, "dd/MM");
    firstDay = startDay.weekday;

    final int imageCount = (dateList.length / numPerFrame).round();
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 120,
        aspectRatio: 2.0,
        // enlargeCenterPage: false,
        // viewportFraction: 1,
      ),
      itemCount: imageCount,
      itemBuilder: (context, index, realIndex) {
        // final int first = index;
        // final int? second = index < imageCount - 1 ? first + 1 : null;
        // final int? seven = index <= (dateList.length / 7).ceil() - 1 ? first + 1 : null;
        final List<int?> list = [
          index * numPerFrame,
          index * numPerFrame + 1,
          index * numPerFrame + 2,
          index * numPerFrame + 3,
          // index * numPerFrame + 4,
          // index * numPerFrame + 5,
          // index * numPerFrame + 6
        ];

        return Row(
          children: [...list].map((idx) {
            return idx != null
                ? Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 100,
                      // child: Image.network(imgList[idx], fit: BoxFit.cover),
                      color: idx == 0 ? AppColors.current.primaryColor : null,
                      child: BorderContainer(
                        padding: EdgeInsets.all(Dimens.d1.responsive()),
                        // child: Center(child: Text("${weekdays[(firstDay + idx) % 7 ]}\n\n${dateList[idx].split("/").join("\n")}", textAlign: TextAlign.center)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 3),
                            Text("${weekdays[(firstDay + idx) % 7]}", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor.withOpacity(0.7))),
                            SizedBox(height: 3),
                            Divider(
                              color: AppColors.current.primaryColor,
                            ),
                            Text("${dateList[idx].split("/")[0]}", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor)),
                            Text("${dateList[idx].split("/")[1]}", style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor.withOpacity(0.7))),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container();
          }).toList(),
        );
      },
    );
  }
}

//* BorderAddressItem
class BorderAddressItem extends StatelessWidget {
  const BorderAddressItem({
    super.key,
    this.onPressed,
    this.address,
  });

  final Function? onPressed;
  final Address? address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: BorderContainer(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.d10.responsive(),
          vertical: Dimens.d10.responsive(),
        ),
        child: Column(
          children: [
            Container(
              // height: Dimens.d80.responsive(),
              padding: EdgeInsets.all(Dimens.d10.responsive()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            address?.district ?? "Chọn địa điểm nấu ăn",
                            style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimens.d10.responsive()),
                      Icon(Icons.edit_location_alt_rounded),
                    ],
                  ),
                  SizedBox(height: Dimens.d10.responsive()),
                  Text(
                    address?.street ?? "",
                    style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
