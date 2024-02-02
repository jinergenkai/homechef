import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/create_address.dart';

@RoutePage()
class CreateAddressPage extends StatefulWidget {
  const CreateAddressPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateAddressPageState();
  }
}

class _CreateAddressPageState extends BasePageState<CreateAddressPage, CreateAddressBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const CreateAddressPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return CommonScaffold(
      appBar: CommonAppBar(
        // leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.back : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: "Tạo địa chỉ nấu ăn",
        backgroundColor: AppColors.current.whiteColor,
        titleTextStyle: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
        height: Dimens.d70.responsive(),
        elevation: 0.7,
      ),
      body: SafeArea(
        child: BlocBuilder<CreateAddressBloc, CreateAddressState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(Dimens.d30.responsive()),
                  child: Column(children: [
                    //title
                    Container(alignment: Alignment.centerLeft, child: Text("Chọn Quận/Huyện", style: AppTextStyles.s16w600Primary())),
                    SizedBox(height: Dimens.d10.responsive()),
                    DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width * 0.835,
                        initialSelection: '03b430db-565c-4465-8d48-165c86ad89e3',
                        // controller: _courseController[index],
                        requestFocusOnTap: false,
                        onSelected: (value) => bloc.add(DistrictChanged(selectedDistrictId: value ?? '')),
                        inputDecorationTheme: InputDecorationTheme(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.current.primaryColor, width: 1.0),
                          ),
                        ),
                        dropdownMenuEntries: state.districts.map<DropdownMenuEntry<String>>((District quan) {
                          return DropdownMenuEntry<String>(
                            value: quan.id,
                            label: quan.name,
                            // enabled: monAn != 'Cơm tấm',
                            // style: MenuItemButton.styleFrom(
                            //     // foregroundColor: AppColors.current.primaryColor,
                            //     ),
                          );
                        }).toList()),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "Đường/Phố/Xã",
                      hintText: "Enter address",
                      onChanged: (address) => bloc.add(AddressChanged(address: address)),
                      suffixIcon: Assets.images.locationBlackSvg,
                      keyboardType: TextInputType.text,
                    ),
                    // SizedBox(height: Dimens.d20.responsive()),
                    // AppTextField(
                    //   title: "NAME OF PLACE",
                    //   hintText: "House number 1",
                    //   // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                    //   keyboardType: TextInputType.text,
                    // ),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "Người liên hệ",
                      hintText: "Nguyen Van A",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: Dimens.d20.responsive()),
                    AppTextField(
                      title: "Số điện thoại",
                      hintText: "0903 123 123",
                      // onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                      keyboardType: TextInputType.text,
                    ),
                  ])),
            );
          },
        ),
      ),
      //* floating button next
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !showFab
          ? null
          : Container(
              margin: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
              child: CommonEllipseButon(
                onPressed: () {
                  // navigator.push(const AppRouteInfo.createAddress());
                  bloc.add(const CreateAddressButtonPressed());
                },
                text: "Tạo",
              ),
            ),
    );
  }
}
