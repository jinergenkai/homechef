import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import '../app.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        height: Dimens.d1.responsive(),
        width: Dimens.d125.responsive(),
        color:const Color.fromARGB(255, 226, 226, 226),
      ),
      Text("  ${S.current.or}  ", style: AppTextStyles.s16w500(color: AppColors.current.blackColor)),
      Container(
        height: Dimens.d1.responsive(),
        width: Dimens.d125.responsive(),
        color:const Color.fromARGB(255, 226, 226, 226),
      ),
    ]);
  }
}
