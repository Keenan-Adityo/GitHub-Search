import 'package:core/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserSearchResponse extends Equatable {
  UserSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.user,
  });

  int totalCount;
  bool incompleteResults;
  List<UserModel> user;

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      UserSearchResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        user: List<UserModel>.from(json["items"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(user.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [totalCount, incompleteResults, user];
}