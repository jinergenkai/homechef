import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class CommonEllipseButon extends StatefulWidget {
  const CommonEllipseButon({
    super.key,
    this.onPress,
    this.text = "Button",
    this.color,
    this.textColor,
    this.buttonType = ButtonEllipseType.primary,
    this.quantity = "2.5h",
    this.price = 0,
    this.action = "Action",
    this.icon,
  });
  final Function? onPress;
  final String? text;
  final Color? color;
  final Color? textColor;
  final ButtonEllipseType buttonType;
  final String quantity;
  final double price;
  final String action;
  final IconData? icon;

  @override
  State<CommonEllipseButon> createState() => _CommonEllipseButonState();
}

class _CommonEllipseButonState extends State<CommonEllipseButon> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.buttonType) {
      ButtonEllipseType.primary => Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.d4.responsive(),
            horizontal: Dimens.d2.responsive(),
          ),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPress as void Function()?,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color ?? AppColors.current.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              padding: EdgeInsets.all(Dimens.d4.responsive()),
            ),
            child: Container(
              height: Dimens.d45.responsive(),
              padding: EdgeInsets.symmetric(horizontal: Dimens.d4.responsive()),
              alignment: Alignment.center,
              child: (widget.icon != null)
                  ? Row(
                      children: [
                        Icon(widget.icon, size: Dimens.d40.responsive()),
                        SizedBox(width: Dimens.d8.responsive()),
                        Text(
                          widget.text ?? "Button",
                          style: (widget.onPress == null) ? AppTextStyles.s20w600(color: AppColors.current.disabledColor) : AppTextStyles.s20w600(color: AppColors.current.whiteColor),
                        ),
                      ],
                    )
                  : Text(
                      widget.text ?? "Button",
                      style: (widget.onPress == null) ? AppTextStyles.s20w600(color: AppColors.current.disabledColor) : AppTextStyles.s20w600(color: AppColors.current.whiteColor),
                    ),
            ),
          ),
        ),
      ButtonEllipseType.checkout => Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.d4.responsive(),
            horizontal: Dimens.d2.responsive(),
          ),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (widget.onPress != null) {
                widget.onPress!();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color ?? AppColors.current.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              padding: EdgeInsets.all(Dimens.d4.responsive()),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(
                  //   vertical: Dimens.d4.responsive(),
                  //   horizontal: Dimens.d2.responsive(),
                  // ),
                  // constraints: const BoxConstraints.expand(),
                  height: Dimens.d45.responsive(),
                  width: Dimens.d45.responsive(),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: AppColors.current.whiteColor,
                  ),
                  child: Text(
                    widget.quantity,
                    style: AppTextStyles.s20w600(color: AppColors.current.primaryTextColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.d8.responsive()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.price.toString(), style: AppTextStyles.s20w600White()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.action,
                              style: AppTextStyles.s20w600White(),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: Dimens.d30.responsive()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ButtonEllipseType.inverse => Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.d4.responsive(),
            horizontal: Dimens.d2.responsive(),
          ),
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              if (widget.onPress != null) {
                widget.onPress!();
              }
            },
            style: OutlinedButton.styleFrom(
              elevation: 0,
              // backgroundColor: widget.color ?? AppColors.current.primaryTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              side: BorderSide(
                color: widget.color ?? AppColors.current.primaryTextColor,
                width: 3,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.d12.responsive()),
              child: Text(
                widget.text ?? "Button",
                style: AppTextStyles.s20w600(color: AppColors.current.primaryColor),
              ),
            ),
          ),
        ),
    };
  }
}
