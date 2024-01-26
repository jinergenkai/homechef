import 'package:flutter/material.dart';

import '../resource/styles/app_colors.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.color,
    super.key,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color ?? AppColors.current.primaryColor,
          width: 1.5,
        ),
      ),
      padding: padding ?? EdgeInsets.all(10),
      child: child,
    );
  }
}
