import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source.dart';
import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/category/data/repository/category_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/repository/category_repository.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/use_case/category_use_case.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:fake_ecommerce_app/src/features/home/data/data_source/home_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/home/data/repository/home_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/repository/home_repository.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/use_case/home_use_case.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
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

  /// category feature
  // bloc
  sl.registerFactory(() => CategoryBloc(categoryUseCase: sl()));

  // use case
  sl.registerLazySingleton(() => CategoryUseCase(categoryRepository: sl()));

  // repository
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<CategoryDataSource>(() => CategoryDataSourceImpl());



  ///
  /// core


  ///
  /// external
}
