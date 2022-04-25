import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<User>>> getUser(String query, int page);
  Future<Either<Failure, List<Issues>>> getIssues(String query);
  Future<Either<Failure, List<Repo>>> getRepo(String query);
}
