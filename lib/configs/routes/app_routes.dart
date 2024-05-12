import 'package:flutter/material.dart';
import 'package:neo_auth/features/auth/presentation/pages/authorization.dart';
import 'package:neo_auth/features/mail_conformation/presentation/pages/mail_confirmation.dart';
import 'package:neo_auth/features/registration/presentation/pages/registration.dart';
import 'package:neo_auth/features/welcome/presentation/pages/welcome.dart';

class AppRoutes {
  AppRoutes._();

  static const String authorization = '/authorization';
  static const String registration = '/registration';
  static const String welcome = '/welcome';
  static const String mail = '/mail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      authorization: (context) => const Authorization(),
      registration: (context) => const Registration(),
      welcome: (context) => const Welcome(),
      mail: (context) => const MailConfirmation(),
    };
  }
}