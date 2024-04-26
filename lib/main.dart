import 'package:flutter/material.dart';
import 'package:neo_auth/authorization.dart';
import 'package:neo_auth/splash.dart';

void main() {
  return runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/authorization': (context) => const Authorization(),
      },
    ),
  );
}
