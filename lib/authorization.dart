import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(height: 24),
            Image.asset(AppAssets.auth),
            const SizedBox(height: 32),
            Text(
              'Вэлком бэк!',
              style: AppStyles.s40w500.copyWith(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
