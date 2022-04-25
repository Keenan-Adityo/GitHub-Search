import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class UserCardList extends StatelessWidget {
  final User user;

  const UserCardList({required this.user, Key? key}) : super(key: key);

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
              child: Image(
                image: NetworkImage(user.avatarUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.login,
                style: kHeading5.copyWith(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IssuesCardList extends StatelessWidget {
  final Issues issues;

  const IssuesCardList({required this.issues, Key? key}) : super(key: key);

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
              child: Image(
                image: NetworkImage(issues.user.avatarUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: issues.title,
                      style:
                          kHeading5.copyWith(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Last Update: ' +
                        issues.updatedAt.day.toString() +
                        '/' +
                        issues.updatedAt.month.toString() +
                        '/' +
                        issues.updatedAt.year.toString(),
                    style: kSubtitle.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              top: 8,
            ),
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  issues.state,
                  style: kHeading6.copyWith(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff2dba4e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RepoCardList extends StatelessWidget {
  final Repo repo;

  const RepoCardList({required this.repo, Key? key}) : super(key: key);

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
              child: Image(
                image: NetworkImage(repo.owner.avatarUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: repo.name,
                      style:
                          kHeading5.copyWith(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Text(
                    'Created at: ' +
                        repo.createdAt.day.toString() +
                        '/' +
                        repo.createdAt.month.toString() +
                        '/' +
                        repo.createdAt.year.toString(),
                    style: kSubtitle.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      repo.watchersCount.toString(),
                      textAlign: TextAlign.end,
                      style: kHeading5.copyWith(
                          fontSize: 10, color: Colors.grey[800]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.remove_red_eye_sharp,
                      size: 12,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      repo.stargazersCount.toString(),
                      textAlign: TextAlign.end,
                      style: kHeading5.copyWith(fontSize: 10),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.blue,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      repo.forksCount.toString(),
                      textAlign: TextAlign.end,
                      style: kHeading5.copyWith(fontSize: 10),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.web_stories,
                      size: 12,
                      color: Colors.blue,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserCardGrid extends StatelessWidget {
  final User user;
  const UserCardGrid({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              user.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              user.login,
              style: kHeading6.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class IssuesCardGrid extends StatelessWidget {
  final Issues issues;
  const IssuesCardGrid({Key? key, required this.issues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              issues.user.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              issues.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              'Last Update: ' +
                  issues.updatedAt.day.toString() +
                  '/' +
                  issues.updatedAt.month.toString() +
                  '/' +
                  issues.updatedAt.year.toString(),
              style: kSubtitle.copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class RepoCardGrid extends StatelessWidget {
  final Repo repo;
  const RepoCardGrid({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              repo.owner.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              repo.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              'Created at: ' +
                  repo.createdAt.day.toString() +
                  '/' +
                  repo.createdAt.month.toString() +
                  '/' +
                  repo.createdAt.year.toString(),
              style: kSubtitle.copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
