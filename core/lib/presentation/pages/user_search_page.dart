import 'package:flutter/material.dart';

class UserSearchPage extends StatelessWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return UserSearchList();
          } else if (constraints.maxWidth <= 1200) {
            return UserSearchGrid();
          } else {
            return UserSearchGrid();
          }
        },
      ),
    );
  }
}

class UserSearchList extends StatelessWidget {
  const UserSearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserSearchGrid extends StatelessWidget {
  const UserSearchGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
