import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/favorite_book_bloc/favorite_book_bloc.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import 'favorite_results.dart';
import 'package:easy_localization/easy_localization.dart';

class FavoritesBody extends StatefulWidget {
  const FavoritesBody({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<FavoritesBody> {
  FavoriteBookBloc? _bookBloc;

  @override
  void initState() {
    super.initState();
    _bookBloc = BlocProvider.of<FavoriteBookBloc>(context);
    _bookBloc!.add(LoadFavoriteBook());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBookBloc, FavoriteBookState>(
      builder: (context, state) {
        if (state is FavoriteBooksStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteBooksStateLoaded) {
          return state.books.isEmpty
              ? Center(child: Text(LocaleKeys.favorite_book_not_found.tr()))
              : Expanded(child: FavoriteResults(books: state.books));
        }

        return const SizedBox();
      },
    );
  }
}
