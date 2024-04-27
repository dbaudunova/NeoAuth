import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: Text(title),
      titleTextStyle: AppStyles.s16w500.copyWith(color: AppColors.red),
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.all(16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
