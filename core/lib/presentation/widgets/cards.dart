import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 75,
              color: mainColor,
              child: Image(image: NetworkImage(user.avatarUrl)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.login,
                style: kHeading5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IssuesCard extends StatelessWidget {
  final Issues issues;

  const IssuesCard({required this.issues, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 75,
              color: mainColor,
              child: Image(image: NetworkImage(issues.user.avatarUrl)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    issues.title,
                    style: kHeading5,
                  ),
                  Text(
                    issues.updatedAt.year.toString(),
                    style: kSubtitle,
                  ),
                ],
              ),
            ),
          ),
          Text(issues.state)
        ],
      ),
    );
  }
}

class RepoCard extends StatelessWidget {
  final Repo repo;

  const RepoCard({required this.repo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 75,
              color: mainColor,
              child: Image(image: NetworkImage(repo.owner.avatarUrl)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.name,
                    style: kHeading5,
                  ),
                  Text(
                    repo.createdAt.year.toString(),
                    style: kSubtitle,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Text('Total Watchers'),
              Text('Total Stars'),
              Text('Total Forks'),
            ],
          )
        ],
      ),
    );
  }
}