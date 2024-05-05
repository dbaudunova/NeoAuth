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
    required this.controller,
    this.onChanged,
    this.validator,
    this.errorText,
  });

  final bool? obscureText;
  final VoidCallback? onPressed;
  final Widget? icon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      style: AppStyles.s16w500.copyWith(
        color: AppColors.buttonColor,
      ),
      cursorColor: AppColors.buttonColor,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: icon ?? const Icon(null),
        ),
      ),
    );
  }
}
