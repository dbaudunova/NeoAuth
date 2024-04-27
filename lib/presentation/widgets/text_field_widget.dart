import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.obscureText,
    this.onPressed,
    this.icon,
    required this.hintText,
  });

  final bool? obscureText;
  final VoidCallback? onPressed;
  final Widget? icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.s16w500.copyWith(
        color: AppColors.buttonColor,
      ),
      cursorColor: AppColors.buttonColor,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: icon ?? const Icon(null),
        ),
      ),
    );
  }
}
