import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/get_user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/transformers.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final GetUser _getUser;

  SearchUserBloc(this._getUser) : super(UserEmpty()) {
    on<OnSubmittedUser>((event, emit) async {
      final query = event.query;

      emit(UserLoading());
      final result = await _getUser.execute(query);

      result.fold(
        (failure) {
          emit(UserError(failure.message));
        },
        (data) {
          print('dapet');
          emit(UserHasData(data));
        },
      );
    });
  }
}
