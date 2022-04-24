import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetIssues {
  final Repository repository;

  GetIssues(this.repository);

  Future<Either<Failure, List<Issues>>> execute(String query) {
    return repository.getIssues(query);
  }
}
