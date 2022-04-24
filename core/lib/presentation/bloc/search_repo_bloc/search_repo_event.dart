part of 'search_repo_bloc.dart';

@immutable
abstract class SearchRepoEvent extends Equatable {
  const SearchRepoEvent();

  @override
  List<Object?> get props => [];
}

class OnSubmittedRepo extends SearchRepoEvent {
  final String query;

  const OnSubmittedRepo(this.query);

  @override
  List<Object> get props => [query];
}

