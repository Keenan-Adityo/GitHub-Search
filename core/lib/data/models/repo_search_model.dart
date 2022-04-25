import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:equatable/equatable.dart';

class RepoSearchResponse {
  RepoSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<RepoModel> items;

  factory RepoSearchResponse.fromJson(Map<String, dynamic> json) =>
      RepoSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<RepoModel>.from(
            json["items"].map((x) => RepoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class RepoModel extends Equatable {
  const RepoModel({
    required this.name,
    required this.owner,
    required this.createdAt,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.id,
  });

  final String name;
  final int id;
  final UserModel owner;
  final DateTime createdAt;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        name: json["name"],
        owner: UserModel.fromJson(json["owner"]),
        createdAt: DateTime.parse(json["created_at"]),
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        forksCount: json["forks_count"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner.toJson(),
        "created_at": createdAt.toIso8601String(),
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "forks_count": forksCount,
        "id": id,
      };

  Repo toEntity() {
    return Repo(
      id: id,
      name: name,
      owner: owner.toEntity(),
      createdAt: createdAt,
      forksCount: forksCount,
      stargazersCount: stargazersCount,
      watchersCount: watchersCount,
    );
  }

  @override
  List<Object?> get props => [
        name,
        owner,
        createdAt,
        stargazersCount,
        watchersCount,
        forksCount,
      ];
}
