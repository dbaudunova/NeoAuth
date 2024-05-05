import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/configs/theme/app_theme.dart';
import 'package:neo_auth/features/registration/data/data_source/remote/registration_data_source.dart';
import 'package:neo_auth/features/registration/data/repository/registration_repository_impl.dart';
import 'package:neo_auth/features/registration/domain/repository/registration_repository.dart';
import 'package:neo_auth/features/registration/domain/usecase/registration_use_case.dart';
import 'package:neo_auth/features/registration/presentation/bloc/registration_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RegistrationBloc(RegistrationUseCase(
                RegistrationRepositoryImpl(RegistrationDataSourceImpl()))))
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
