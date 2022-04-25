import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/issues.dart';
import 'package:equatable/equatable.dart';

class IssuesSearchResponse {
  IssuesSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<IssuesModel> items;

  factory IssuesSearchResponse.fromJson(Map<String, dynamic> json) =>
      IssuesSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<IssuesModel>.from(
            json["items"].map((x) => IssuesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class IssuesModel extends Equatable {
  IssuesModel({
    required this.title,
    required this.state,
    required this.updatedAt,
    required this.user,
    required this.id,
  });

  final String title;
  final String state;
  final DateTime updatedAt;
  final UserModel user;
  final int id;

  factory IssuesModel.fromJson(Map<String, dynamic> json) => IssuesModel(
        title: json["title"],
        state: json["state"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: UserModel.fromJson(json["user"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "state": state,
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "id": id,
      };

  Issues toEntity() {
    return Issues(
      title: title,
      updatedAt: updatedAt,
      id: id,
      state: state,
      user: user.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        title,
        state,
        updatedAt,
        user,
        id,
      ];
}
