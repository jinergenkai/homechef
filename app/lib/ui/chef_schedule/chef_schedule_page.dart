import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/chef_schedule.dart';

@RoutePage()
class ChefSchedulePage extends StatefulWidget {
  const ChefSchedulePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChefSchedulePageState();
  }
}

class _ChefSchedulePageState extends BasePageState<ChefSchedulePage, ChefScheduleBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChefSchedulePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Lịch nhận việc trực tiếp",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<ChefScheduleBloc, ChefScheduleState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(Dimens.d20.responsive()),
                    child: Column(
                      children: [
                        //* option
                        BorderContainer(
                            padding: EdgeInsets.all(Dimens.d15.responsive()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nhận nấu trực tiếp.", style: AppTextStyles.s16w600(color: AppColors.current.primaryColor)),
                                StyledSwitch(
                                  enabledColor: AppColors.current.primaryColor,
                                ),
                              ],
                            )),
                        SizedBox(height: Dimens.d20.responsive()),
                        //*table schedule
                        DemoTableChefSchedule(),
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
            navigator.pop();
          },
          text: "Cập nhật lịch nhận việc",
        ),
      ),
    );
  }
}











class DemoTableChefSchedule extends StatelessWidget {
  const DemoTableChefSchedule({
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
