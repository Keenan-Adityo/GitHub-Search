import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/repo.dart';
import 'package:core/domain/usecases/get_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_repo_event.dart';
part 'search_repo_state.dart';

class SearchRepoBloc extends Bloc<SearchRepoEvent, SearchRepoState> {
  final GetRepo _getRepo;

  SearchRepoBloc(this._getRepo) : super(RepoEmpty()) {
    on<OnSubmittedRepo>((event, emit) async {
      final query = event.query;

      emit(RepoLoading());
      final result = await _getRepo.execute(query);

      result.fold(
        (failure) {
          emit(RepoError(failure.message));
        },
        (data) {
          print('dapet');
          emit(RepoHasData(data));
        },
      );
    });
  }
}
