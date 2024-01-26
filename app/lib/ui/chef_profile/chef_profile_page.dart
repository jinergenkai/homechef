import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/chef_profile.dart';

@RoutePage()
class ChefProfilePage extends StatefulWidget {
  const ChefProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChefProfilePageState();
  }
}

class _ChefProfilePageState extends BasePageState<ChefProfilePage, ChefProfileBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefProfilePageInitiated());
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
                              image: Assets.images.avatarChef.image().image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.d10.responsive()),
                        //* Name
                        Text(
                          "Tommy Phạm",
                          style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                        ),
                        SizedBox(height: Dimens.d5.responsive()),
                        //* Description
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
                          child: Text(
                            "Tôi tin rằng quan niệm công việc nội trợ là dành cho phụ nữ nên thay đổi.",
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
                        SizedBox(height: Dimens.d15.responsive()),
                        //* Lich trinh dau bep
                        const Text("Lịch nhận nấu ăn", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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

  @override
  Widget build(BuildContext context) {
    return Table(
      // border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(50),
        // 1: FixedColumnWidth(Dimens.d50),
        // 2: FixedColumnWidth(Dimens.d50),
        // 3: FixedColumnWidth(Dimens.d50),
      },

      children: [
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T2')),
            TableCell(child: CellTable(text: 'Sáng', onPressed: () {})),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T3')),
            TableCell(child: CellTable(text: 'Sáng')),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều', onPressed: () {})),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T4')),
            TableCell(child: CellTable(text: 'Sáng', onPressed: () {})),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T5')),
            TableCell(child: CellTable(text: 'Sáng')),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều', onPressed: () {})),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T6')),
            TableCell(child: CellTable(text: 'Sáng')),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều', onPressed: () {})),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'T7')),
            TableCell(child: CellTable(text: 'Sáng')),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều', onPressed: () {})),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: TitleTable(title: 'CN')),
            TableCell(child: CellTable(text: 'Sáng')),
            TableCell(child: CellTable(text: 'Trưa')),
            TableCell(child: CellTable(text: 'Chiều', onPressed: () {})),
          ],
        ),
      ],
    );
  }
}

class CellTable extends StatelessWidget {
  const CellTable({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.d2.responsive()),
      child: CommonSmallButton(
        onpressed: onPressed,
        text: text,
        color: AppColors.current.chefPrimaryColor,
        textColor: onPressed != null ? AppColors.current.whiteColor : AppColors.current.blackColor,
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
