import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:fake_ecommerce_app/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/data/data_source/auth_data_source.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/data/data_source/auth_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/data/repository/auth_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/domain/repository/auth_repository.dart';
import 'package:fake_ecommerce_app/src/features/auth/root/domain/use_case/auth_use_case.dart';
import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source.dart';
import 'package:fake_ecommerce_app/src/features/category/data/data_source/category_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/category/data/repository/category_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/repository/category_repository.dart';
import 'package:fake_ecommerce_app/src/features/category/domain/use_case/category_use_case.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/product/data/data_source/product_data_source.dart';
import 'package:fake_ecommerce_app/src/features/product/data/data_source/product_data_source_impl.dart';
import 'package:fake_ecommerce_app/src/features/product/data/repository/product_repository_impl.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/repository/product_repository.dart';
import 'package:fake_ecommerce_app/src/features/product/domain/use_case/product_use_case.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  /// features start

  /// auth feature
  // bloc
  sl.registerFactory(() => LoginBloc(useCase: sl()));

  // use case
  sl.registerLazySingleton(() => AuthUseCase(authRepository: sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  /// product feature
  // bloc
  sl.registerFactory(() => ProductBloc(productUseCase: sl()));

  // use case
  sl.registerLazySingleton(() => ProductUseCase(productRepository: sl()));

  // repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl());

  /// category feature
  // bloc
  sl.registerFactory(() => CategoryBloc(categoryUseCase: sl()));

  // use case
  sl.registerLazySingleton(() => CategoryUseCase(categoryRepository: sl()));

  // repository
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<CategoryDataSource>(() => CategoryDataSourceImpl());

  ///
  /// core

  ///
  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LocalStorage(sl<SharedPreferences>()));
}
