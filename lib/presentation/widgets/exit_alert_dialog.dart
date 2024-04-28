import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';

class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({
    super.key,
    required this.onTap,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onTap;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(title),
            const SizedBox(height: 24),
            Text(
              AppTexts.areYouSure,
              style: AppStyles.s16w500,
            ),
          ],
        ),
      ),
      titleTextStyle: AppStyles.s20w400.copyWith(
        fontWeight: FontWeight.bold,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  AppTexts.yesExactly,
                  style: AppStyles.s16w500.copyWith(
                    color: AppColors.textField,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: Text(
                AppTexts.noStay,
                style: AppStyles.s16w500.copyWith(
                  color: AppColors.buttonColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
