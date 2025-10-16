import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:markatty/Core/Networking/api_service.dart';
import 'package:markatty/Features/Home/data/repositories/category_repository.dart';
import 'package:markatty/Features/Home/data/repositories/product_repository.dart';
import 'package:markatty/Features/Home/presentation/Manager/category_cubit/category_cubit.dart';
import 'package:markatty/Features/Home/presentation/Manager/products_cubit/products_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await getIt.reset();

  // Dio and ApiService
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(getIt<ApiService>()),
  );
  // Cubits
  getIt.registerFactory(() => CategoryCubit(getIt<CategoryRepository>()));
  getIt.registerFactory(
    () => ProductsCubit(repository: getIt<ProductRepository>()),
  );
}
