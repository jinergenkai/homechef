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
                padding: EdgeInsets.all(Dimens.d20.responsive()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Date picker
                    BorderContainer(
                        // height: 100,
                        color: AppColors.current.disabledColor,
                        padding: EdgeInsets.all(Dimens.d15.responsive()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                // height: 150,
                                child: CarouselSliderMutiple()),
                          ],
                        )),

                    SizedBox(
                      height: 20,
                    ),
                    //* Time picker
                    BorderContainer(
                        padding: EdgeInsets.all(Dimens.d15.responsive()),
                        child: Row(children: [
                          Assets.images.clock.image(),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Time", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IntrinsicWidth(
                                child: BorderContainer(
                                  padding: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive(), vertical: Dimens.d8.responsive()),
                                    child: Row(
                                  children: [
                                    Text("12", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor)),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: Dimens.d10.responsive()),
                                      height: Dimens.d20.responsive(),
                                      width: Dimens.d1.responsive(),
                                      color: AppColors.current.primaryColor,
                                    ),
                                    Text("00", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor)),
                                  ],
                                )),
                              ),
                            ),
                          )
                        ])),
                    
                    SizedBox(height: 10),

                    //* Estimated arrival time
                    Text("The Chef's estimated arrival time is ${DateTime.now().toStringWithFormat("dd/MM")}", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
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

List<String> getFutureDateStrings(int numberOfDays, String pattern) {
  List<String> dateStrings = [];

  for (int i = 0; i < numberOfDays; i++) {
    DateTime currentDate = DateTime.now().add(Duration(days: i));
    String formattedDate = DateFormat(pattern).format(currentDate);
    dateStrings.add(formattedDate);
  }

  return dateStrings;
}

// final List<int> dateList = [10, 20, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
final List<String> dateList = getFutureDateStrings(20, "dd/MM");
final int firstDay = DateTime.now().weekday;
final List<String> weekdays = ["CN", "T2", "T3", "T4", "T5", "T6", "T7"];

class CarouselSliderMutiple extends StatelessWidget {
  // https://stackoverflow.com/questions/64716588/multiple-items-in-one-slide-flutter-dart
  final int numPerFrame = 4;

  @override
  Widget build(BuildContext context) {
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
