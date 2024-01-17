import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/choose_menu.dart';

@RoutePage()
class ChooseMenuPage extends StatefulWidget {
  const ChooseMenuPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseMenuPageState();
  }
}

class _ChooseMenuPageState extends BasePageState<ChooseMenuPage, ChooseMenuBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChooseMenuPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Choose Menu",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(Dimens.d20.responsive()),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      // ListView.builder(
                      // shrinkWrap: true,
                      // physics: const ClampingScrollPhysics(),
                      //   itemBuilder: (context, index) => Text("${index}"),
                      //   itemCount: 60,
                      // ),
                      //* Number of People
                      CommonSmallTitle(text: "People"),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.d45.responsive()),
                          border: Border.all(
                            color: AppColors.current.blackColor.withOpacity(0.2), // Set the border color here
                            width: 2.0, // Set the border width if needed
                          ),
                        ),
                        height: 30,
                        // width: Dimens.d200.responsive(),
                        child: IntrinsicWidth(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  bloc.add(const PeopleChanged(amount: -1));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  // shape: CircleBorder(),
                                  elevation: 0,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  child: Text(
                                    "-",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),

                              Divider(color: Colors.black),
                              BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
                                buildWhen: (previous, current) => previous.people != current.people,
                                builder: (context, state) {
                                  return Text("${state.people}", style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor));
                                },
                              ),
                              Divider(color: Colors.black),
                              ElevatedButton(
                                onPressed: () {
                                  bloc.add(const PeopleChanged(amount: 1));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  // shape: CircleBorder(),
                                  elevation: 0,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  child: Text(
                                    "+",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),

                              // OutlinedButton(onPressed: () {}, child: Text("-")),
                              // Text(" 1 "),
                              // OutlinedButton(onPressed: () {}, child: Text("+")),
                            ],
                          ),
                        ),
                      ),

                      //* Number of Courses
                      CommonSmallTitle(text: "Courses"),
                      BorderContainer(
                          child: BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
                        buildWhen: (previous, current) => previous.menu != current.menu,
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${state.menu.length} Courses", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                              SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) => 
                              AppTextField(
                                hintText: "${index}",
                                // controller: "${state.menu[index]}",
                                suffixIcon: Assets.images.trash,
                                
                                keyboardType: TextInputType.visiblePassword,
                              ),
                                itemCount: state.menu.length,
                              ),
                              SizedBox(
                                height: 10,),
                              Container(
                                width: double.infinity,
                                height: Dimens.d40.responsive(),
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      bloc.add(const AddCourse());
                                    },
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: Dimens.d5.responsive()),
                                      child: Text("+", style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor)),
                                    )),
                              ),
                            ],
                          );
                        },
                      )),

                      //* Prefer Style
                      CommonSmallTitle(text: "Prefer Style"),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Text("Checkbox 1"),
                          value: false,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Text("Checkbox 2"),
                          value: false,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Text("Checkbox 3"),
                          value: false,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),

                      //* Dessert
                      CommonSmallTitle(text: "Dessert"),
                      BorderContainer(child: Text("Fruit")),

                      //* Optional
                      CommonSmallTitle(text: "Optional"),
                      Text("Optional"),

                      //* Note for Tasker
                      CommonSmallTitle(text: "Note for Tasker"),
                      AppTextField(
                        maxLines: null,
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //* Button Next Step
                      CommonEllipseButon(
                        buttonType: ButtonEllipseType.checkout,
                        action: "Next",
                        price: 100,
                        quantity: "123",
                        onPressed: () {
                          navigator.push(const AppRouteInfo.setTime());
                        },
                      )
                    ])));
          },
        ),
      ),
    );
  }
}

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.d10.responsive()),
        border: Border.all(
          color: AppColors.current.primaryColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(Dimens.d10.responsive()),
      child: child,
    );
  }
}

class CommonSmallTitle extends StatelessWidget {
  const CommonSmallTitle({
    super.key,
    this.text = "",
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: Dimens.d8.responsive()), child: Text(text, style: AppTextStyles.s16w600(color: AppColors.current.primaryTextColor)));
  }
}
