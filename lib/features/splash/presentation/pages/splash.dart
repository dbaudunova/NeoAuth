import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_dimensions.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _closeSplash();
  }

  void _closeSplash() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.authorization),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.lorby,
              style: AppStyles.s40w500,
            ),
            const SizedBox(height: AppDimensions.d12),
            Text(
              AppTexts.yourOwnTutor,
              style: AppStyles.s20w400,
            ),
            const SizedBox(height: AppDimensions.d64),
            Image.asset(AppAssets.splash),
          ],
        ),
      ),
    );
  }
}
