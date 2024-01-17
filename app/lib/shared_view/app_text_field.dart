import 'package:flutter/material.dart';

import '../app.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.title = '',
    this.hintText = '',
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    super.key,
  });

  final String title;
  final String hintText;
  final SvgGenImage? suffixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: title.isEmpty ? const SizedBox.shrink() : Text(
            title,
            style: AppTextStyles.s16w600Primary(),
          ),
        ),
        SizedBox(height: Dimens.d8.responsive()),
        TextField(
          maxLines: maxLines,
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Dimens.d20.responsive(),
              vertical: Dimens.d12.responsive(),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
              borderSide: BorderSide(
                color: AppColors.current.disabledColor,
                width: Dimens.d1.responsive(),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
              borderSide: BorderSide(
                color: AppColors.current.primaryColor,
                width: Dimens.d1.responsive(),
              ),
            ),
            
            hintText: hintText,
            hintStyle: AppTextStyles.s16w500(color: AppColors.current.disabledColor),
            suffixIcon: obscureText || suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: Dimens.d25.responsive()),
                    child: suffixIcon?.svg(height: Dimens.d10.responsive(), width: Dimens.d10.responsive())
                  )
                : null,
          ),
          style: AppTextStyles.s16w500(color: AppColors.current.primaryTextColor),
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: '●',
        ),

      ],
    );
  }
}
