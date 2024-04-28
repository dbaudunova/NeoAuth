import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/presentation/widgets/exit_alert_dialog.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.welcomeBack,
                style: AppStyles.s40w500.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                '${AppTexts.lorby} - ${AppTexts.yourOwnTutor.toLowerCase()}',
                style: AppStyles.s20w400,
              ),
              const SizedBox(height: 64),
              Image.asset(AppAssets.splash),
              const SizedBox(height: 124),
              GestureDetector(
                onTap: () {
                  _buildShowDialog(context);
                },
                child: Text(
                  AppTexts.exit,
                  style: AppStyles.s16w500.copyWith(
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return ExitAlertDialog(
          title: '${AppTexts.exit}?',
          onTap: () => Navigator.pop(context),
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoutes.authorization,
          ),
        );
      },
    );
  }
}
