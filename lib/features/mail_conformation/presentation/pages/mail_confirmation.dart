import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_dimensions.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/features/mail_conformation/presentation/widgets/mail_alert.dart';
import 'package:neo_auth/features/registration/presentation/widgets/app_bar_widget.dart';

class MailConfirmation extends StatelessWidget {
  const MailConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        onIconPressed: () => Navigator.pop(context),
        title: AppTexts.registration,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.d32).copyWith(top: AppDimensions.d36),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              '${AppTexts.emailSent} dbaudunova@gmail.com',
              style: AppStyles.s20w400.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.d24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: AppTexts.checkSpam,
                style: AppStyles.s16w500,
                children: [
                  TextSpan(
                    text: AppTexts.spam,
                    style: AppStyles.s16w500.copyWith(
                      color: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.d24),
            Text(
              AppTexts.smiley,
              style: AppStyles.s16w500.copyWith(
                color: AppColors.buttonColor,
              ),
            ),
            const SizedBox(height: AppDimensions.d56),
            Image.asset(AppAssets.registerLetter),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _buildShowDialog(context);
              },
              child: Text(
                AppTexts.emailNotCame,
                style: AppStyles.s16w500.copyWith(
                  color: AppColors.buttonColor,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.d24),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return MailAlertDialog(
          onPressed: () => Navigator.pop(context),
          title: '${AppTexts.repeatSend}dbaudunova@gmail.com',
        );
      },
    );
  }
}
