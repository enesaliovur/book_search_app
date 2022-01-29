import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../bloc/book_bloc/book_bloc.dart';
import 'search_results.dart';

class SearchBody extends StatelessWidget {
  SearchBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularProgressIndicator(),
            ],
          ));
        }
        if (state is SearchStateError) {
          return Text(LocaleKeys.no_result_found.tr());
        }
        if (state is SearchStateSuccess) {
          return Expanded(child: SearchResults(books: state.items));
        }
        return SizedBox();
      },
    );
  }
}
