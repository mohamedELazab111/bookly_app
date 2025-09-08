import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchRepo) : super(SearchResultInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchResult({required String searchInfo}) async {
    emit(SearchResultLoading());
    var result = await searchRepo.fetchSearchResults(searchInfo: searchInfo);
    result.fold(
      (failure) {
        emit(SearchResultFailure(failure.errMessage));
      },
      (books) {
        emit(SearchResultSuccess(books));
      },
    );
  }
}
