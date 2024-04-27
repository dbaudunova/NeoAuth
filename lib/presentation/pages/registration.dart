import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      toolbarHeight: 56,
      titleTextStyle: AppStyles.s16w500.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.buttonColor,
      ),
      title: const Text(AppTexts.registration),
    );
  }
}
