part of 'search_repo_bloc.dart';

@immutable
abstract class SearchRepoState extends Equatable {
  const SearchRepoState();

  @override
  List<Object?> get props => [];
}

class RepoEmpty extends SearchRepoState {}

class RepoLoading extends SearchRepoState {}

class RepoHasData extends SearchRepoState {
  final List<Repo> result;

  const RepoHasData(this.result);

  @override
  List<Object?> get props => [result];
}

class RepoError extends SearchRepoState {
  final String message;

  const RepoError(this.message);

  @override
  List<Object> get props => [message];
}
