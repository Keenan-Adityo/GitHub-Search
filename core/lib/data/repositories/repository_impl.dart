import 'package:core/data/datasources/remote_datasource.dart';
import 'package:core/data/models/user_search_response.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:core/utils/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Issues>>> getIssues(String query) async {
    try {
      print('ada disini');
      final result = await remoteDataSource.getIssuesSearch(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } catch (e) {
      print('gatau');
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Repo>>> getRepo(String query) async {
    // try {
    //   print('ada disini');
    //   final result = await remoteDataSource.getRepoSearch(query);
    //   return Right(result.map((model) => model.toEntity()).toList());
    // } on ServerException {
    //   return const Left(ServerFailure(''));
    // } catch (e) {
    //   print('gatau');
    //   return Left(CommonFailure(e.toString()));
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUser(String query) async {
    try {
      print('ada disini');
      final result = await remoteDataSource.getUserSearch(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } catch (e) {
      print('gatau');
      return Left(CommonFailure(e.toString()));
    }
  }
}
