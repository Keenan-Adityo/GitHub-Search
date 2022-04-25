part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {
  final String category;
  final List<User> userResult;
  final int page;
  final bool userHasReachedMax;
  final RequestState userState;
  final List<Issues> issuesResult;
  final bool issuesHasReachedMax;
  final RequestState issuesState;
  final List<Repo> repoResult;
  final bool repoHasReachedMax;
  final RequestState repoState;

  CategoryState copywith({
    List<User>? userResult,
    bool? userHasReachedMax,
    int? page,
    String? category,
    RequestState? userState,
    List<Issues>? issuesResult,
    bool? issuesHasReachedMax,
    RequestState? issuesState,
    List<Repo>? repoResult,
    bool? repoHasReachedMax,
    RequestState? repoState,
  }) {
    return CategoryState(
      userResult: userResult ?? this.userResult,
      userHasReachedMax: userHasReachedMax ?? this.userHasReachedMax,
      page: page ?? this.page,
      category: category ?? this.category,
      userState: userState ?? this.userState,
      issuesResult: issuesResult ?? this.issuesResult,
      issuesHasReachedMax: issuesHasReachedMax ?? this.issuesHasReachedMax,
      issuesState: issuesState ?? this.issuesState,
      repoResult: repoResult ?? this.repoResult,
      repoHasReachedMax: repoHasReachedMax ?? this.repoHasReachedMax,
      repoState: repoState ?? this.repoState,
    );
  }

  const CategoryState({
    required this.category,
    required this.userHasReachedMax,
    required this.page,
    required this.userResult,
    required this.userState,
    required this.issuesHasReachedMax,
    required this.issuesResult,
    required this.issuesState,
    required this.repoHasReachedMax,
    required this.repoResult,
    required this.repoState,
  });

  factory CategoryState.initial() {
    return const CategoryState(
      category: 'User',
      userHasReachedMax: false,
      page: 1,
      userResult: [],
      userState: RequestState.empty,
      issuesHasReachedMax: false,
      issuesResult: [],
      issuesState: RequestState.empty,
      repoHasReachedMax: false,
      repoResult: [],
      repoState: RequestState.empty,
    );
  }

  @override
  List<Object?> get props => [
        category,
        userHasReachedMax,
        page,
        userResult,
        userState,
        issuesHasReachedMax,
        issuesResult,
        issuesState,
        repoHasReachedMax,
        repoResult,
        repoState,
      ];
}
