import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';

class AppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStyle({
    super.key,
    required this.onIconPressed,
    required this.title,
  });

  final VoidCallback onIconPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onIconPressed,
        icon: const Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      toolbarHeight: 56,
      titleTextStyle: AppStyles.s16w500.copyWith(
        color: AppColors.buttonColor,
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}