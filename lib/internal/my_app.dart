import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/configs/theme/app_theme.dart';
import 'package:neo_auth/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:neo_auth/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:neo_auth/internal/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<RegistrationBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<AuthorizationBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: AppRoutes.authorization,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
