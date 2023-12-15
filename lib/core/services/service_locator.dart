
import 'package:apiexam/features/data/repositry/image_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/presentation/cubit/home_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache_helper/cache_helper.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

void initServiceLoactor(){
  //cubit


  //external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CatRepository(apiConsumer: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => HomeCubit(sl<CatRepository>()));


}