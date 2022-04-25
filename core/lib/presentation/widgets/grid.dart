import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/widgets/state_widget_handler.dart';
import 'package:core/presentation/widgets/cards.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Grid extends StatelessWidget {
  final int gridCount;
  const Grid({
    required this.gridCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state.category == 'User') {
          if (state.userState == RequestState.loading) {
            return const LoadingIndicator();
          } else if (state.userState == RequestState.empty) {
            return const EmptyIndicator();
          } else if (state.userState == RequestState.loaded) {
            return SliverGrid.count(
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: state.userResult.map((user) {
                return UserCardGrid(user: user);
              }).toList(),
            );
          } else {
            return const ErrorIndicator();
          }
        } else if (state.category == 'Issues') {
          if (state.issuesState == RequestState.loading) {
            return const LoadingIndicator();
          } else if (state.issuesState == RequestState.empty) {
            return const EmptyIndicator();
          } else if (state.issuesState == RequestState.loaded) {
            return SliverGrid.count(
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: state.issuesResult.map((issues) {
                return IssuesCardGrid(issues: issues);
              }).toList(),
            );
          } else {
            return const ErrorIndicator();
          }
        } else {
          if (state.repoState == RequestState.loading) {
            return const LoadingIndicator();
          } else if (state.repoState == RequestState.empty) {
            return const EmptyIndicator();
          } else if (state.repoState == RequestState.loaded) {
            return SliverGrid.count(
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: state.repoResult.map((repo) {
                return RepoCardGrid(repo: repo);
              }).toList(),
            );
          } else {
            return const ErrorIndicator();
          }
        }
      },
    );
  }
}
