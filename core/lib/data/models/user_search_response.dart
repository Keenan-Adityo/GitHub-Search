import 'dart:convert';

import 'package:core/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

UserSearchResponse userSearchResponseFromJson(String str) => UserSearchResponse.fromJson(json.decode(str));

String userSearchResponseToJson(UserSearchResponse data) => json.encode(data.toJson());


class UserSearchResponse extends Equatable {
  const UserSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.user,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<UserModel> user;

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      UserSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        user: List<UserModel>.from(
            (json["items"] as List).map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(user.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [totalCount, incompleteResults, user];
}
