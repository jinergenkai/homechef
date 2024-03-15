import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/search_over_time.dart';

@RoutePage()
class SearchOverTimePage extends StatefulWidget {
  const SearchOverTimePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchOverTimePageState();
  }
}

class _SearchOverTimePageState extends BasePageState<SearchOverTimePage, SearchOverTimeBloc> {
  var isSearch = false;
  var selectedTime = "Buổi Sáng";

  @override
  void initState() {
    super.initState();
    bloc.add(const SearchOverTimePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Tìm kiếm đầu bếp",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: BlocBuilder<SearchOverTimeBloc, SearchOverTimeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.all(Dimens.d20.responsive()),
              child: Column(
                children: [
                  //* Date picker
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 30)),
                      ).then((date) {
                        if (date != null) {
                          // bloc.add(ChangedDate(date: date));
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
                                child: CarouselSliderMutiple(startDay: DateTime.now())),
                          ],
                        )),
                  ),
                  const SizedBox(
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
                        Text("Thời gian", style: AppTextStyles.s16w700(color: AppColors.current.primaryTextColor)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IntrinsicWidth(
                                child: DropdownButton<String>(
                              value: selectedTime,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime = newValue ?? "Buổi Sáng";
                                });
                              },
                              items: <String>['Buổi Sáng', 'Buổi Trưa', 'Buổi Tối'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor)),
                                );
                              }).toList(),
                            )),
                          ),
                        )
                      ])),

                  SizedBox(
                    height: 20,
                  ),
                  CommonSmallButton(
                    text: "Tìm kiếm",
                    onpressed: () {
                      bloc.add(const PressSearchButton());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //*Chef List
                  BlocBuilder<SearchOverTimeBloc, SearchOverTimeState>(
                    buildWhen: (previous, current) => previous.isLoading != current.isLoading || previous.chefs != current.chefs,
                    builder: (context, state) {
                      return state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: state.chefs.length,
                              itemBuilder: (context, index) => CardChefProfile(
                                onPressed: () => navigator.push(AppRouteInfo.chefProfile(state.chefs[index].copyWith(avatarUrl: "https://i.pravatar.cc/300?img=${index + 20}"))),
                                fullName: state.chefs[index].fullName,
                                biography: state.chefs[index].biography,
                                image: Image.network("https://i.pravatar.cc/300?img=${index + 20}").image,
                              ),
                              // itemBuilder: (context, index) => const MessageItem(),
                            );
                    },
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
