import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/chef_profile.dart';

@RoutePage()
class ChefProfilePage extends StatefulWidget {
  const ChefProfilePage({super.key,
    required this.chef,});

  final CurrentUser chef;

  @override
  State<StatefulWidget> createState() {
    return _ChefProfilePageState();
  }
}

class _ChefProfilePageState extends BasePageState<ChefProfilePage, ChefProfileBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(ChefProfilePageInitiated(chef: widget.chef));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Hồ sơ đầu bếp",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<ChefProfileBloc, ChefProfileState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(Dimens.d15.responsive()),
                    child: Column(
                      children: [
                        //* avatar
                        Container(
                          width: Dimens.d150.responsive(),
                          height: Dimens.d150.responsive(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              // image: Assets.images.avatarChef.image().image,
                              image: !state.chef.avatarUrl.isEmpty ? NetworkImage(state.chef.avatarUrl):  Assets.images.avatarChef.image().image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.d10.responsive()),
                        //* Name
                        Text(
                          state.chef.fullName??"Tommy Phạm",
                          style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                        ),
                        SizedBox(height: Dimens.d5.responsive()),
                        //* Description
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                          child: Text(
                            state.chef.biography ?? "Tôi tin rằng quan niệm công việc nội trợ là dành cho phụ nữ nên thay đổi.",
                            style: AppTextStyles.s14w500(color: AppColors.current.primaryTextColor.withOpacity(.75)),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: Dimens.d15.responsive()),
                        //* Start
                        const Text("4.9", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        //star
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d50.responsive()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: Dimens.d35.responsive()),
                              Icon(Icons.star, color: Colors.yellow, size: Dimens.d35.responsive()),
                              Icon(Icons.star, color: Colors.yellow, size: Dimens.d35.responsive()),
                              Icon(Icons.star, color: Colors.yellow, size: Dimens.d35.responsive()),
                              Icon(Icons.star, color: Colors.yellow, size: Dimens.d35.responsive()),
                            ],
                          ),
                        ),
                        Text(
                          "(7 đánh giá)",
                          style: AppTextStyles.s14w500(color: AppColors.current.blackColor.withOpacity(.75)),
                        ),
                        SizedBox(height: Dimens.d15.responsive()),
                        //* CV
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d50.responsive()),
                          child: CommonEllipseButon(
                            onPressed: () {},
                            text: "Kinh nghiệm (CV)",
                            color: Color(0xFFF1FFFE),
                            textColor: AppColors.current.primaryTextColor,
                          ),
                        ),
                        // SizedBox(height: Dimens.d15.responsive()),
                        //* lich su nau an
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d50.responsive()),
                          child: CommonEllipseButon(
                            onPressed: () {},
                            text: "Lịch sử nấu ăn",
                            color: Color(0xFFF1FFFE),
                            textColor: AppColors.current.primaryTextColor,
                          ),
                        ),
                        SizedBox(height: Dimens.d20.responsive()),
                        //* Lich trinh dau bep
                        const Text("Lịch nhận nấu ăn", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        SizedBox(height: Dimens.d10.responsive()),
                        TableChefSchedule(),

                        SizedBox(height: Dimens.d100.responsive()),
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
            await navigator.push(const AppRouteInfo.chooseMenu());
          },
          text: "Tạo đơn với đầu bếp này",
        ),
      ),
    );
  }
}

class TableChefSchedule extends StatelessWidget {
  const TableChefSchedule({
    super.key,
  });
  Function? onPressed() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T2'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa', setActive: true),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T3'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa', setActive: true),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T4'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa'),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T5'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa', setActive: true),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T6'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa', setActive: true),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'T7'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa', setActive: true),
            CellTable(text: 'Chiều'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(title: 'CN'),
            SizedBox(width: Dimens.d20.responsive()),
            CellTable(text: 'Sáng'),
            CellTable(text: 'Trưa'),
            CellTable(text: 'Chiều'),
          ],
        ),
      ],
    );
  }
}

class CellTable extends StatefulWidget {
  const CellTable({
    super.key,
    required this.text,
    this.onPressed,
    this.setActive = false,
  });

  final String text;
  final Function? onPressed;
  final bool setActive;

  @override
  State<CellTable> createState() => _CellTableState();
}

class _CellTableState extends State<CellTable> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    isActive = widget.setActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.d2.responsive()),
      child: CommonSmallButton(
        onpressed: () {
          setState(() => isActive = !isActive);
        },
        text: widget.text,
        color: isActive ? AppColors.current.chefPrimaryColor : AppColors.current.whiteColor,
        textColor: isActive ? AppColors.current.whiteColor : AppColors.current.blackColor,
      ),
    );
  }
}

class TitleTable extends StatelessWidget {
  const TitleTable({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: Dimens.d2.responsive()),
      // width: double.infinity,
      height: Dimens.d50.responsive(),
      child: Text(
        title,
        style: AppTextStyles.s20w600(color: AppColors.current.chefPrimaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
