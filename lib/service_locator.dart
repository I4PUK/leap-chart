import 'package:chart_test/data/data_source/api_data_source.dart';
import 'package:chart_test/data/repositories/company_repository_impl.dart';
import 'package:chart_test/domain/repositories/company_repository.dart';
import 'package:chart_test/presentation/bloc/dashboard/cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => DashboardCubit(companyRepository: sl()),
  );

  // UseCases

  // Repository
  sl.registerLazySingleton<CompanyRepository>(
    () => CompanyRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ApiDataSource>(() => ApiDataSourceImpl());

  // Core
}
