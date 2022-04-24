import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class Repo extends Equatable {
  const Repo({
    required this.id,
    required this.name,
    required this.owner,
    required this.createdAt,
    required this.forks,
    required this.stargazersCount,
    required this.watchers,
  });

  final int id;
  final String name;
  final User owner;
  final DateTime createdAt;
  final int watchers;
  final int forks;
  final int stargazersCount;

  @override
  List<Object?> get props => [
    id,
    name,
    owner,
    createdAt,
    forks,
    stargazersCount,
    watchers,
  ];
}
