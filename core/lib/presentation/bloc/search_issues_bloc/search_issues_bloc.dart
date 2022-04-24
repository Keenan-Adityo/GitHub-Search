import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/issues.dart';
import 'package:core/domain/usecases/get_issues.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_issues_event.dart';
part 'search_issues_state.dart';

class SearchIssuesBloc extends Bloc<SearchIssuesEvent, SearchIssuesState> {
  final GetIssues _getIssues;

  SearchIssuesBloc(this._getIssues) : super(IssuesEmpty()) {
    on<OnSubmittedIssues>((event, emit) async {
      final query = event.query;

      emit(IssuesLoading());
      final result = await _getIssues.execute(query);

      result.fold(
        (failure) {
          emit(IssuesError(failure.message));
        },
        (data) {
          print('dapet');
          emit(IssuesHasData(data));
        },
      );
    });
  }
}
