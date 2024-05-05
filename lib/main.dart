import 'package:flutter/material.dart';
import 'package:neo_auth/internal/di.dart';
import 'package:neo_auth/internal/my_app.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}
