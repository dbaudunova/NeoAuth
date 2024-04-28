import 'package:flutter/material.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/configs/theme/app_theme.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
    ),
  );
}
