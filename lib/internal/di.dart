import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_auth/features/registration/data/data_source/remote/registration_data_source.dart';
import 'package:neo_auth/features/registration/data/repository/registration_repository_impl.dart';
import 'package:neo_auth/features/registration/domain/repository/registration_repository.dart';
import 'package:neo_auth/features/registration/domain/usecase/registration_use_case.dart';
import 'package:neo_auth/features/registration/presentation/bloc/registration_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerFactory<RegistrationDataSource>(
      () => RegistrationDataSourceImpl());
  sl.registerSingleton<RegistrationRepository>(RegistrationRepositoryImpl(sl()));
  sl.registerSingleton<RegistrationUseCase>(RegistrationUseCase(sl()));
  sl.registerFactory<RegistrationBloc>(() => RegistrationBloc(sl()));
}
