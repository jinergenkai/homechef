import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../../common_view/border_container.dart';
import 'bloc/choose_menu.dart';

@RoutePage()
class ChooseMenuPage extends StatefulWidget {
  const ChooseMenuPage({super.key, this.order});

  final CookingOrder? order;

  @override
  State<StatefulWidget> createState() {
    return _ChooseMenuPageState();
  }
}

class _ChooseMenuPageState extends BasePageState<ChooseMenuPage, ChooseMenuBloc> {
  late ColorLabel _selectedValue = ColorLabel.blue;
  final _courseController = List<TextEditingController>.generate(10, (i) => TextEditingController());

  @override
  void initState() {
    super.initState();
    bloc.add(ChooseMenuPageInitiated(order: widget.order));
  }

  @override
  Widget buildPage(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Thực đơn",
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
                      CommonSmallTitle(text: "Số lượng người ăn"),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.d45.responsive()),
                          border: Border.all(
                            color: AppColors.current.disabledColor,
                            width: 1.0,
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
                      SizedBox(height: 20),

                      //* Number of Courses
                      CommonSmallTitle(text: "Món ăn"),
                      BorderContainer(
                          child: BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
                        buildWhen: (previous, current) => previous.dishes != current.dishes,
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${state.dishes.length} món chính", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                              SizedBox(height: 5),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: DropdownMenu<Dish>(
                                      width: MediaQuery.of(context).size.width * 0.835,
                                      initialSelection: state.menu.first,
                                      requestFocusOnTap: false,
                                      onSelected: (Dish? dish) {
                                        if (dish != null) {
                                          bloc.add(ChooseMenuDishChanged(dish: dish, index: index));
                                        }
                                      },
                                      inputDecorationTheme: InputDecorationTheme(
                                        fillColor: Colors.red,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: AppColors.current.primaryColor, width: 1.0),
                                        ),
                                      ),
                                      dropdownMenuEntries: state.menu.map<DropdownMenuEntry<Dish>>((Dish monAn) {
                                        return DropdownMenuEntry<Dish>(
                                          value: monAn,
                                          label: monAn.name,
                                        );
                                      }).toList()),
                                ),
                                itemCount: state.dishes.length,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: AppTextField(
                                  hintText: "Khác",
                                  // controller: "${state.menu[index]}",
                                  // suffixIcon: Assets.images.trash,

                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              SizedBox(height: 20),
                              //* add course
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
                      SizedBox(height: 20),

                      //* Prefer Style
                      CommonSmallTitle(text: "Hương vị ưa thích"),
                      BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
                        buildWhen: (previous, current) => previous.cookingOrder.dishType != current.cookingOrder.dishType,
                        builder: (context, state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => bloc.add(FlavorChanged(flavor: "Bắc")),
                                child: Container(
                                  color: state.cookingOrder.dishType == 0 ? AppColors.current.primaryColor : AppColors.current.whiteColor,
                                  child: BorderContainer(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      padding: EdgeInsets.all(Dimens.d10.responsive()),
                                      child: Center(
                                          child: Text("Bắc", style: AppTextStyles.s16w600(color: state.cookingOrder.dishType != 0 ? AppColors.current.primaryColor : AppColors.current.whiteColor)))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => bloc.add(FlavorChanged(flavor: "Trung")),
                                child: Container(
                                  color: state.cookingOrder.dishType == 1 ? AppColors.current.primaryColor : AppColors.current.whiteColor,
                                  child: BorderContainer(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      padding: EdgeInsets.all(Dimens.d10.responsive()),
                                      child: Center(
                                          child: Text("Trung", style: AppTextStyles.s16w600(color: state.cookingOrder.dishType != 1 ? AppColors.current.primaryColor : AppColors.current.whiteColor)))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => bloc.add(FlavorChanged(flavor: "Nam")),
                                child: Container(
                                  color: state.cookingOrder.dishType == 2 ? AppColors.current.primaryColor : AppColors.current.whiteColor,
                                  child: BorderContainer(
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      padding: EdgeInsets.all(Dimens.d10.responsive()),
                                      child: Center(
                                          child: Text("Nam", style: AppTextStyles.s16w600(color: state.cookingOrder.dishType != 2 ? AppColors.current.primaryColor : AppColors.current.whiteColor)))),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 20),

                      //* Optional
                      CommonSmallTitle(text: "Tùy chọn"),
                      BorderContainer(
                          padding: EdgeInsets.all(Dimens.d15.responsive()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Trái cây", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                              StyledSwitch(
                                enabledColor: AppColors.current.primaryColor,
                                onToggled: (value) {
                                  bloc.add(OptionChanged(isSelected: value, option: OptionMenu.fruit));
                                },
                              ),
                            ],
                          )),
                      SizedBox(height: 10),
                      BorderContainer(
                          padding: EdgeInsets.all(Dimens.d15.responsive()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kèm đi chợ", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                              StyledSwitch(
                                enabledColor: AppColors.current.primaryColor,
                                onToggled: (value) {
                                  bloc.add(OptionChanged(isSelected: value, option: OptionMenu.shopping));
                                },

                              ),
                            ],
                          )),
                      SizedBox(height: 10),
                      BorderContainer(
                          padding: EdgeInsets.all(Dimens.d15.responsive()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cung cấp bàn ghế\n(dựa trên người ăn)", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                              StyledSwitch(
                                enabledColor: AppColors.current.primaryColor,
                                onToggled: (value) {
                                  bloc.add(OptionChanged(isSelected: value, option: OptionMenu.chairSupply));
                                },
                              ),
                            ],
                          )),
                      SizedBox(height: 20),
                      //* Note for Tasker
                      CommonSmallTitle(text: "Ghi chú cho người nấu"),
                      AppTextField(
                        onChanged: (value) {
                          bloc.add(NoteChanged(note: value));
                        },
                        maxLines: null,
                      ),

                      SizedBox(height: 80),
                    ])));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !showFab
          ? null
          : Container(
              margin: EdgeInsets.symmetric(horizontal: Dimens.d20.responsive()),
              child: BlocBuilder<ChooseMenuBloc, ChooseMenuState>(
                buildWhen: (previous, current) => previous.cookingOrder != current.cookingOrder,
                builder: (context, state) {
                  return CommonEllipseButon(
                    buttonType: ButtonEllipseType.checkout,
                    action: "Tiếp theo",
                    price: state.cookingOrder.price.toDouble(),
                    quantity: state.cookingOrder.cookedHour.toDouble(),
                    onPressed: () {
                      navigator.push(AppRouteInfo.setTime(state.cookingOrder));
                    },
                  );
                },
              ),
            ),
    );
  }

  // void _showDropdown(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Chọn giá trị'),
  //         content: DropdownButton<String>(
  //           value: _selectedValue,
  //           items: ['Giá trị 1', 'Giá trị 2', 'Giá trị 3']
  //               .map<DropdownMenuItem<String>>(
  //                 (String value) => DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(value),
  //                 ),
  //               )
  //               .toList(),
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               _selectedValue = newValue ?? "";
  //             });
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
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

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

//list mon an binh dan viet nam
final List<String> MonAn = [
  'Bún chả',
  'Bún đậu mắm tôm',
  'Cà pháo',
  'Cơm tấm',
  'Đậu phụ',
  'Gà chiên nước mắm',
  'Gà xào sả ớt',
  'Tôm hấp',
  'Rau muống xào tỏi',
  'Rau cải luộc',
  'Bò xào hành tây',
];

var flavors = [
  'Bắc',
  'Trung',
  'Nam',
];
