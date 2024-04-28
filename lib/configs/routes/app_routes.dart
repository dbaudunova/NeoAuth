import 'package:flutter/material.dart';
import 'package:neo_auth/presentation/pages/authorization.dart';
import 'package:neo_auth/presentation/pages/registration.dart';
import 'package:neo_auth/presentation/pages/splash.dart';
import 'package:neo_auth/presentation/pages/welcome.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String authorization = '/authorization';
  static const String registration = '/registration';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const Splash(),
      authorization: (context) => const Authorization(),
      registration: (context) => const Registration(),
      welcome: (context) => const Welcome(),
    };
  }
}