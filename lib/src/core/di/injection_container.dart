import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/home/data/repository/home_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/repository/home_repository.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/use_case/home_use_case.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features start

  /// home feature
  // bloc
  sl.registerFactory(() => HomeBloc(homeUseCase: sl()));

  // use case
  sl.registerLazySingleton(() => HomeUseCase(homeRepository: sl()));

  // repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());


  /// core


  /// external
}
