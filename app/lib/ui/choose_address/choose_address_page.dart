import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/choose_address.dart';

@RoutePage()
class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseAddressPageState();
  }
}

class _ChooseAddressPageState extends BasePageState<ChooseAddressPage, ChooseAddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const ChooseAddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Choose Address",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<ChooseAddressBloc, ChooseAddressState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            //* List Address
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimens.d8.responsive(),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimens.d24.responsive(),
                      vertical: Dimens.d8.responsive(),
                    ),
                    child: AddressItem(
                        onPressed: () {
                          navigator.push(const AppRouteInfo.chooseMenu());
                        },
                        title: Text("Thành Phố Thủ Đức $index")),
                  );
                },
              ),
            );
          },
        ),
      ),

      //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
        child: CommonEllipseButon(
          onPressed: () {
            navigator.push(const AppRouteInfo.createAddress());
          },
          text: "Add a new Address",
        ),
      ),
    );
  }
}

//* AddressItem
class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    this.onPressed,
    this.title,
  });

  final Function? onPressed;
  final Text? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        // height: Dimens.d100.responsive(),
        // width: Dimens.d150.responsive(),
        decoration: BoxDecoration(
          color: AppColors.current.whiteColor,
          borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
          boxShadow: [
            BoxShadow(
              color: AppColors.current.blackColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              // offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        // margin: EdgeInsets.symmetric(
        //   horizontal: Dimens.d24.responsive(),
        //   vertical: Dimens.d8.responsive(),
        // ),
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
                      // Icon(Icons.location_on),
                      // SizedBox(width: Dimens.d10.responsive()),

                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title?.data ?? "",
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
                    "FPT University HCMC, Đường D1, Long Thạnh Mỹ, TP Thủ Đức, Thành Phố Hồ Chí Minh, Việt Nam, Trái Đất.",
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
