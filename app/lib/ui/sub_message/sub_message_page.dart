import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/sub_message.dart';

@RoutePage()
class SubMessagePage extends StatefulWidget {
  const SubMessagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SubMessagePageState();
  }
}

class _SubMessagePageState extends BasePageState<SubMessagePage, SubMessageBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const SubMessagePageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<SubMessageBloc, SubMessageState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return MessageItem(
                    onPressed: () {
                      // navigator.push(const AppRouteInfo.main());
                    },
                    title: Text("message $index"));
              },
            );
          },
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
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
              color: AppColors.current.blackColor.withOpacity(0.03),
              spreadRadius: 2,
              blurRadius: 5,
              // offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.d12.responsive(),
          vertical: Dimens.d6.responsive(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.d10.responsive(),
          vertical: Dimens.d10.responsive(),
        ),
    
        child: Row(
          children: [
            Assets.images.avatar.image(),
            Expanded(
              child: Container(
                height: Dimens.d80.responsive(),
                padding: EdgeInsets.all(Dimens.d10.responsive()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title?.data ?? "",
                      style: AppTextStyles.s20w600(color: AppColors.current.blackColor),
                    ),
                    const Text("Chef Address"),
                    const Text(
                      "Description: I am a chef hahahaalkfaaaa",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
