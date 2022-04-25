import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/presentation/widgets/state_widget_handler.dart';
import 'package:core/presentation/widgets/cards.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LazyLoadingList extends StatelessWidget {
  const LazyLoadingList({
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
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return (index < state.userResult.length)
                      ? UserCard(user: state.userResult[index])
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
                childCount: (state.userHasReachedMax)
                    ? state.userResult.length
                    : state.userResult.length + 1,
              ),
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
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return (index < state.issuesResult.length)
                      ? IssuesCard(issues: state.issuesResult[index])
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
                childCount: state.issuesResult.length,
              ),
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
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return (index < state.repoResult.length)
                      ? RepoCard(repo: state.repoResult[index])
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
                childCount: state.repoResult.length,
              ),
            );
          } else {
            return const ErrorIndicator();
          }
        }
      },
    );
  }
}




