import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final Repository repository;

  GetUser(this.repository);

  Future<Either<Failure, List<User>>> execute(String query) {
    return repository.getUser(query);
  }
}
