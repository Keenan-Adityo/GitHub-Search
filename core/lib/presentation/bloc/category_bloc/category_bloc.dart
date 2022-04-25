import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/get_issues.dart';
import 'package:core/domain/usecases/get_repo.dart';
import 'package:core/domain/usecases/get_user.dart';
import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetUser _getUser;
  final GetIssues _getIssues;
  final GetRepo _getRepo;

  CategoryBloc(this._getUser, this._getIssues, this._getRepo)
      : super(CategoryState.initial()) {
    on<OnChangeUser>((event, emit) {
      emit(state.copywith(category: 'User'));
    });

    on<OnChangeIssues>((event, emit) {
      emit(state.copywith(category: 'Issues'));
    });

    on<OnChangeRepo>((event, emit) {
      emit(state.copywith(category: 'Repositories'));
    });

    on<OnSubmittedUser>((event, emit) async {
      final query = event.query;

      emit(state.copywith(userState: RequestState.loading));
      final result = await _getUser.execute(query, state.page);

      result.fold(
        (failure) {
          emit(state.copywith(userState: RequestState.error));
        },
        (data) {
          (data.isEmpty)
              ? emit(state.copywith(userState: RequestState.empty))
              : emit(state.copywith(
                  userState: RequestState.loaded,
                  page: event.page,
                  userHasReachedMax: false,
                  userResult: data,
                ));
        },
      );
    });

    on<OnScrollUser>((event, emit) async {
      CategoryState categoryState = state;

      int pages = categoryState.page + 1;
      final result = await _getUser.execute(event.query, pages);

      result.fold(
        (failure) {
          emit(state.copywith(userState: RequestState.error));
        },
        (data) {
          emit((data.isEmpty)
              ? categoryState.copywith(userHasReachedMax: true)
              : state.copywith(
                  userResult: categoryState.userResult + data,
                  userHasReachedMax: false,
                  page: pages,
                ));
        },
      );
    });

    on<OnSubmittedIssues>((event, emit) async {
      final query = event.query;

      emit(state.copywith(issuesState: RequestState.loading));
      final result = await _getIssues.execute(query, state.page);

      result.fold(
        (failure) {
          emit(state.copywith(issuesState: RequestState.error));
        },
        (data) {
          (data.isEmpty)
              ? emit(state.copywith(issuesState: RequestState.empty))
              : emit(state.copywith(
                  issuesState: RequestState.loaded,
                  page: event.page,
                  issuesHasReachedMax: false,
                  issuesResult: data,
                ));
        },
      );
    });

    on<OnScrollIssues>((event, emit) async {
      CategoryState categoryState = state;

      int pages = categoryState.page + 1;
      final result = await _getIssues.execute(event.query, pages);

      result.fold(
        (failure) {
          emit(state.copywith(issuesState: RequestState.error));
        },
        (data) {
          emit((data.isEmpty)
              ? categoryState.copywith(issuesHasReachedMax: true)
              : state.copywith(
                  issuesResult: categoryState.issuesResult + data,
                  issuesHasReachedMax: false,
                  page: pages,
                ));
        },
      );
    });

    on<OnSubmittedRepo>((event, emit) async {
      final query = event.query;

      emit(state.copywith(repoState: RequestState.loading));
      final result = await _getRepo.execute(query, state.page);

      result.fold(
        (failure) {
          emit(state.copywith(repoState: RequestState.error));
        },
        (data) {
          (data.isEmpty)
              ? emit(state.copywith(repoState: RequestState.empty))
              : emit(state.copywith(
                  repoState: RequestState.loaded,
                  page: event.page,
                  repoHasReachedMax: false,
                  repoResult: data,
                ));
        },
      );
    });

    on<OnScrollRepo>((event, emit) async {
      CategoryState categoryState = state;

      int pages = categoryState.page + 1;
      final result = await _getRepo.execute(event.query, pages);

      result.fold(
        (failure) {
          emit(state.copywith(repoState: RequestState.error));
        },
        (data) {
          emit((data.isEmpty)
              ? categoryState.copywith(repoHasReachedMax: true)
              : state.copywith(
                  repoResult: categoryState.repoResult + data,
                  repoHasReachedMax: false,
                  page: pages,
                ));
        },
      );
    });
  }
}
