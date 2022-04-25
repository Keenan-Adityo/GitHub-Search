import 'package:core/data/datasources/remote_datasource.dart';
import 'package:core/data/repositories/repository_impl.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:core/domain/usecases/get_issues.dart';
import 'package:core/domain/usecases/get_repo.dart';
import 'package:core/domain/usecases/get_user.dart';
import 'package:http/http.dart' as http;
import 'package:core/data/datasources/local_datasource.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/bloc/pagination_bloc/pagination_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => CategoryBloc(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => PaginationBloc());

  // usecase
  locator.registerLazySingleton(() => GetUser(locator()));
  locator.registerLazySingleton(() => GetIssues(locator()));
  locator.registerLazySingleton(() => GetRepo(locator()));

  //repository
  locator.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
