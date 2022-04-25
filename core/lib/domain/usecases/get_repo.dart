import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetRepo {
  final Repository repository;

  GetRepo(this.repository);

  Future<Either<Failure, List<Repo>>> execute(String query, int page) {
    return repository.getRepo(query, page);
  }
}
