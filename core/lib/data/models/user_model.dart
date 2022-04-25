import 'package:core/domain/entities/user.dart';

class UserModel {
  const UserModel({
    required this.login,
    required this.avatarUrl,
    required this.id,
    required this.url,
  });

  final String login;
  final int id;
  final String avatarUrl;
  final String url;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "id": id,
        "url": url,
      };

  User toEntity() {
    return User(
      avatarUrl: avatarUrl,
      url: url,
      login: login,
      id: id,
    );
  }
}
