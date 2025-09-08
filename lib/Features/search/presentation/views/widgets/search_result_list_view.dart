import 'package:bookly_app/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_result/search_result_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/empty_search_result_body.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBooksListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is SearchResultFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else if (state is SearchResultLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const EmptySearchResultBody();
        }
      },
    );
  }
}
