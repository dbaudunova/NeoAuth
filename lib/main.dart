import 'package:flutter/material.dart';
import 'package:neo_auth/presentation/pages/authorization.dart';
import 'package:neo_auth/configs/theme/app_theme.dart';
import 'package:neo_auth/presentation/pages/registration.dart';
import 'package:neo_auth/presentation/pages/splash.dart';

void main() {
  return runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/authorization': (context) => const Authorization(),
        '/registration': (context) => const Registration(),
      },
    ),
  );
}
