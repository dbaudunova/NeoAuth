import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';

class MailAlertDialog extends StatelessWidget {
  const MailAlertDialog({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            title,
            style: AppStyles.s20w400.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            textAlign: TextAlign.center,
            AppTexts.checkSpamAgain,
            style: AppStyles.s16w500.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              AppTexts.gotIt,
              style: AppStyles.s16w500.copyWith(
                color: AppColors.textField,
              ),
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
