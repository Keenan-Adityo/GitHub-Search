import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/get_user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final GetUser _getUser;

  SearchUserBloc(this._getUser) : super(UserEmpty()) {
    on<OnSubmittedUser>((event, emit) async {
      final query = event.query;

      emit(UserLoading());
      final result = await _getUser.execute(query, 1);

      result.fold(
        (failure) {
          emit(UserError(failure.message));
        },
        (data) {
          emit(UserHasData(
            result: data,
            hasReachedMax: false,
            page: 1,
          ));
        },
      );
    });

    on<OnScrollUser>((event, emit) async {
      print('masuk scroll');
      UserHasData userHasData = state as UserHasData;

      int pages = userHasData.page + 1;
      final result = await _getUser.execute(event.query, pages);

      result.fold(
        (failure) {
          emit(UserError(failure.message));
        },
        (data) {
          emit((data.isEmpty)
              ? userHasData.copywith(hasReachedMax: true)
              : UserHasData(
                  result: userHasData.result + data,
                  hasReachedMax: false,
                  page: pages,
                ));
        },
      );
    });
  }
}
