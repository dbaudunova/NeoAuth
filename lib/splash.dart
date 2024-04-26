import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed('/authorization'),
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
              'Lorby',
              style: AppStyles.s40w500,
            ),
            const SizedBox(height: 16),
            Text(
              'Твой личный репетитор',
              style: AppStyles.s20w400,
            ),
            const SizedBox(height: 64),
            Image.asset(AppAssets.splash),
          ],
        ),
      ),
    );
  }
}
